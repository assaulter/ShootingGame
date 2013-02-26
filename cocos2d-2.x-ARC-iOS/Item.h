//
//  Item.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/26.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef NS_OPTIONS(NSUInteger, ItemType) {
    ItemTypeNormal   = 0,
    ItemTypeParallel = 1 << 0,
    ItemTypeThreeWay = 1 << 1,
};

@interface Item : CCSprite {
    
}

@property (nonatomic, assign) ItemType type;

@end
