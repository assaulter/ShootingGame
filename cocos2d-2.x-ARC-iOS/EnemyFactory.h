//
//  EnemyFactory.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/03/04.
//
//

#import <Foundation/Foundation.h>
#import "EnemyProduct.h"

typedef NS_ENUM(NSUInteger, EnemyType) {
    EnemyTypeNormal = 0,
    EnemyTypeSlow,
    EnemyTypeFast,
    EnemyTypeBoss
};

@protocol EnemyFactoryDelegate <NSObject>
@required
-(void)spriteMoveFinished:(id)sender;
@end

// this is concrete factory class
// TODO: create factory protocol
@interface EnemyFactory : NSObject

@property(nonatomic, assign) id<EnemyFactoryDelegate> delegate;
-(EnemyProduct*)createProductFromEnemyType:(EnemyType)type;
-(NSArray*)getAnimationsFromEnemyType:(EnemyType)type enemy:(EnemyProduct*)enemy;

@end
