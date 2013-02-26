//
//  ItemInterface.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/26.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef NS_OPTIONS(NSUInteger, ItemType) {
    ItemTypeNormal   = 0,
    ItemTypeParallel = 1 << 0,
    ItemTypeThreeWay = 1 << 1,
};

@protocol ItemInterface <NSObject>
@required
-(ItemType)getItemType;
@end
