//
//  Player.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Player : CCSprite {
}

// なぜか自身のpositionを書き換えようとすると落ちる。
-(void)moveToPoint:(CGPoint)point;

@end
