//
//  PlayerLayer.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "PlayerLayer.h"


@implementation PlayerLayer

-(id)initWithWinSize:(CGSize)winSize {
    if (self = [super init]) {
        _player = [Player new];
        _player.position = ccp(winSize.width/2, _player.contentSize.height/2);
        [self addChild:_player];
    }
    return self;
}

@end
