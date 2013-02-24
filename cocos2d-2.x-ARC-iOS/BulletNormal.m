//
//  BulletNormal.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "BulletNormal.h"


@implementation BulletNormal

-(id)init {
    if (self = [super init]) {
        self = [CCSprite spriteWithFile:@"Projectile2.jpg"];
    }
    return self;
}

@end
