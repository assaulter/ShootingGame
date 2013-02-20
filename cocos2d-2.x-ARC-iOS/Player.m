//
//  Player.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Player.h"


@implementation Player

-(id)init {
    if (self = [super init]) {
        self = [CCSprite spriteWithFile:@"Player.png"];
    }
    return self;
}

// ユーザーの指のpositionに移動する
-(void)moveToPoint:(CGPoint)point {
    // 長さ1に正規化されたベクトル
    CGPoint v = ccpNormalize(ccpSub(point, self.position));
    self.position = ccpAdd(v, self.position);
}

@end
