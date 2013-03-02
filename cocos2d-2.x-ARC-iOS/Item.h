//
//  Item.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/26.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SpriteTag.h"

typedef NS_ENUM(NSUInteger, ItemType) {
    ItemTypeNormal = 0,
    ItemTypeParallel,
    ItemTypeThreeWay,
};

@interface Item : CCSprite {
}

@property (nonatomic, assign) ItemType type;

@end
