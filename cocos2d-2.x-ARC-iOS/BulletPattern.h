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
@required
-(void)addBulletToLayer:(BulletNormal*)bullet;
@end

@protocol BulletPattern <NSObject>
@property(nonatomic, assign) id<BulletPatternDelegate> delegate;

@required
-(NSArray*)createBullet:(CGPoint)playerPosition;
@end
