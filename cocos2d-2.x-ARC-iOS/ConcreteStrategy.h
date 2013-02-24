//
//  ConcreteStrategy.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BulletStrategy.h"
#import "BulletNormal.h"

@interface ConcreteStrategy : CCSprite<BulletStrategy> {
    
}

-(id)getAnimation:(BulletNormal*)bullet;

@end
