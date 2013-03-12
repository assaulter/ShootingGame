//
//  Boss.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/03/05.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Boss.h"


@implementation Boss

-(id)init {
    if (self = [super init]) {
        self = [CCSprite spriteWithFile:@"Target4.png"];
    }
    return self;
}

-(id)initWithFile:(NSString *)filename lifePoint:(int)lifePoint {
    if (self = [super init]) {
        self = [CCSprite spriteWithFile:filename];
        self.lifePoint = lifePoint;
    }
    return self;
}

@end
