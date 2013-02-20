//
//  PowerUpItem.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "PowerUpItem.h"


@implementation PowerUpItem

-(id)init {
    if (self = [super init]) {
        self = [CCSprite spriteWithFile:@"PowerUp.png"];
    }
    return self;
}

@end
