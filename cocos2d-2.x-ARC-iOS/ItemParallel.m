//
//  ItemParallel.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/26.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "ItemParallel.h"


@implementation ItemParallel

-(id)init {
    if (self = [super init]) {
        self = [CCSprite spriteWithFile:@"Parallel.png"];
    }
    return self;
}

-(ItemType)getItemType {
    return ItemTypeParallel;
}

@end
