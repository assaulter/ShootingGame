//
//  SpriteTag.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/28.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SpriteTags) {
    SpriteTagsItem = 0,
    SpriteTagsBullet,
    SpriteTagsEnemy,
};

@interface SpriteTag : NSObject

@end
