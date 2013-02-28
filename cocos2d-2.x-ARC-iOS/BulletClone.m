//
//  BulletClone.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/28.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "BulletClone.h"


@implementation BulletClone

-(id)init {
    if (self = [super init]) {
        self = [CCSprite spriteWithFile:@"Projectile2.jpg"];
    }
    return self;
}

-(id<BulletPrototype>)createClone {
    BulletClone *clone = [BulletClone new];
    _life = 2;
    
    return clone;
}

@end
