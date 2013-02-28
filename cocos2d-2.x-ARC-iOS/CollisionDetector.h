//
//  CollisionDetector.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/28.
//
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Item.h"

/// いわゆる当たり判定君(Staticな関数群を定義する)
@interface CollisionDetector : NSObject

// 今のところplayerとitemの当たり判定のみ特殊なことをやるので、型を指定
+(BOOL)isCollided:(Player*)player item:(Item*)item;
+(BOOL)isCollided:(CCSprite*)sprite sprite:(CCSprite*)toSprite;

@end
