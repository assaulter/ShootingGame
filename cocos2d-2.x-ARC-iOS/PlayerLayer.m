//
//  PlayerLayer.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "PlayerLayer.h"
#import "BulletNormal.h"


@implementation PlayerLayer

-(id)init {
    if (self = [super init]) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        self.bullets = [NSMutableArray new];
        self.player = [Player new];
        self.player.position = ccp(winSize.width/2, self.player.contentSize.height/2);
        self.strategy = [ConcreteStrategy new];
        [self addChild:self.player];
        [self schedule:@selector(addBullet:) interval:1.0f];
    }
    return self;
}

// add bullets
-(void)addBullet:(ccTime)dt {
    BulletNormal *bullet = [[BulletNormal alloc] init];
    
    bullet.position = self.player.position;
    [self addChild:bullet];
    
    bullet.tag = 2;
    [_bullets addObject:bullet];
    
    // create actions
//    id actionMove = [CCMoveTo actionWithDuration:5.0f position:ccp(bullet.position.x, winSize.height + bullet.contentSize.height/2)];
    id acitonMove = [self.strategy getAnimation:bullet];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)];
    [bullet runAction:[CCSequence actions:acitonMove, actionMoveDone, nil]];
}

// アニメーションが終了した時の処理 = 画面から消えたとき
-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    if (sprite.tag == 2) {
        [self.bullets removeObject:sprite];
    }
    [self removeChild:sprite cleanup:YES];
}

@end
