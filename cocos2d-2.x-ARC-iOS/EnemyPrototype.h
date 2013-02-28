//
//  EnemyPrototype.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/28.
//
//

#import <Foundation/Foundation.h>

@protocol EnemyPrototype <NSObject>

-(id<EnemyPrototype>)createClone;

@end
