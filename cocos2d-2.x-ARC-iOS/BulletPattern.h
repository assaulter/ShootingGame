//
//  BulletPattern.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/25.
//
//

#import <Foundation/Foundation.h>
#import "BulletNormal.h"

@protocol BulletPatternDelegate <NSObject>

-(void)addBulletToLayer:(BulletNormal*)bullet;

@end

@protocol BulletPattern <NSObject>

@property(nonatomic, assign) id delegate;

@end
