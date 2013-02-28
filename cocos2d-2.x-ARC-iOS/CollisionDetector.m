//
//  CollisionDetector.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/28.
//
//

#import "CollisionDetector.h"

@implementation CollisionDetector

// playerとitemの当たり判定
+(BOOL)isCollided:(Player*)player item:(Item*)item {
    CGRect playerRect = [self createRectForCollision:player];
    CGRect itemRect = [self createRectForCollision:item];
    
    return CGRectIntersectsRect(playerRect, itemRect);
}

+(BOOL)isCollided:(CCSprite*)sprite sprite:(CCSprite*)toSprite {
    CGRect spriteRect = [self createRectForCollision:sprite];
    CGRect toSpriteRect = [self createRectForCollision:toSprite];
    
    return CGRectIntersectsRect(spriteRect, toSpriteRect);
}

+(CGRect)createRectForCollision:(CCSprite*)sprite {
    return CGRectMake(sprite.position.x - (sprite.contentSize.width/2), sprite.position.y - (sprite.contentSize.height/2), sprite.contentSize.width, sprite.contentSize.height);
}

@end
