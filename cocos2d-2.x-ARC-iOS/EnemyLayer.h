//
//  EnemyLayer.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "EnemyFactory.h"

@interface EnemyLayer : CCLayer<EnemyFactoryDelegate> {
    EnemyFactory *_factory;
}

@property(nonatomic, strong) NSMutableArray *enemies;

@end
