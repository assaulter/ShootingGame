//
//  BulletPrototype.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/28.
//
//

#import <Foundation/Foundation.h>

@protocol BulletPrototype <NSObject>

-(id<BulletPrototype>)createClone;

@end
