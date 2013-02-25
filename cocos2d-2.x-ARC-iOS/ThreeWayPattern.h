//
//  ThreeWayPattern.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/25.
//
//

#import <Foundation/Foundation.h>
#import "BulletPattern.h"
#import "BulletNormal.h"

@interface ThreeWayPattern : NSObject<BulletPattern>

-(BulletNormal*)addBullet:(CGPoint)playerPosition;

@end
