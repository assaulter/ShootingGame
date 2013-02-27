//
//  EnemyLayer.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "EnemyLayer.h"
#import "Enemy.h"

@implementation EnemyLayer

-(id)init {
    if (self = [super init]) {
        self.enemies = [NSMutableArray new];
        [self schedule:@selector(addEnemy:) interval:3.0f];
    }
    return self;
}

// add enemies
-(void)addEnemy:(ccTime)dt {
    Enemy *enemy = [Enemy new];
    
    // Determine where to spawn the target along the X axis
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int minX = enemy.contentSize.width/2;
    int maxX = winSize.width - minX;
    int rangeX = maxX - minX;
    int actualX = (arc4random() % rangeX) + minX;
    
    enemy.position = ccp(actualX, winSize.height + (enemy.contentSize.height/2));
    [self addChild:enemy];
    
    // save item to MutableArray
    enemy.tag = SpriteTagsEnemy;
    [self.enemies addObject:enemy];
    
    // create actions
    id actionMove = [CCMoveTo actionWithDuration:5.0f
                                        position:ccp(actualX, -enemy.contentSize.height/2)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self
                                             selector:@selector(spriteMoveFinished:)];
    [enemy runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

// アニメーションが終了した時の処理 = 画面から消えたとき
-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    if (sprite.tag == SpriteTagsEnemy) {
        [self.enemies removeObject:sprite];
    }
    [self removeChild:sprite cleanup:YES];
}

@end
