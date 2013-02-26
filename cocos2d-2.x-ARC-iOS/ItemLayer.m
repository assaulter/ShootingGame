//
//  ItemLayer.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "ItemLayer.h"
#import "ItemParallel.h"


@implementation ItemLayer

-(id)init {
    if (self = [super init]) {
        self.items = [NSMutableArray new];
        [self schedule:@selector(addItem:) interval:10.0f];
    }
    return self;
}

// add items
-(void)addItem:(ccTime)dt {
    ItemParallel *item = [ItemParallel new];
    
    // Determine where to spawn the target along the X axis
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int minX = item.contentSize.width/2;
    int maxX = winSize.width - minX;
    int rangeX = maxX - minX;
    int actualX = (arc4random() % rangeX) + minX;
    
    item.position = ccp(actualX, winSize.height + (item.contentSize.height/2));
    [self addChild:item];
    
    // save item to MutableArray
    item.tag = 1;
    [self.items addObject:item];
    
    // create actions
    id actionMove = [CCMoveTo actionWithDuration:10.0f
                                        position:ccp(actualX, -item.contentSize.height/2)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self
                                             selector:@selector(spriteMoveFinished:)];
    [item runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

// アニメーションが終了した時の処理 = 画面から消えたとき
-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    if (sprite.tag == 1) {
        [self.items removeObject:sprite];
    }
    [self removeChild:sprite cleanup:YES];
}

@end
