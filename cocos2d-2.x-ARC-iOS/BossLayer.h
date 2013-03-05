//
//  BossLayer.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/03/05.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Boss.h"

@interface BossLayer : CCLayer {
    
}

@property(nonatomic, strong) Boss *boss; // player(GameSceneから参照するために)
@property(nonatomic, strong) NSMutableArray *bullets; // 弾を持つ配列(当たり判定は別クラスでやるので)

@end
