//
//  BossLayer.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/03/05.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "BossLayer.h"

/// Boss専用レイヤー(おそらくplayerと同列のため)
@implementation BossLayer

-(id)init {
    if (self = [super init]) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        self.bullets = [NSMutableArray new];
//        self.boss = [[Boss alloc] initWithFile:@"Target4.png" lifePoint:10];
        self.boss = [Boss new];
        self.boss.position = ccp(winSize.width/2, winSize.height - self.boss.contentSize.height/2);
        
        [self addChild:self.boss];
    }
    return self;
}

@end
