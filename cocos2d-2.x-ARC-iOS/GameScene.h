//
//  GameScene.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PlayerLayer.h"
#import "ItemLayer.h"
#import "GamePadLayer.h"
#import "EnemyLayer.h"
#import "BossLayer.h"

@interface GameScene : CCLayerColor {
    PlayerLayer *_playerLayer;
    ItemLayer *_itemLayer;
    EnemyLayer *_enemyLayer;
    BossLayer *_bossLayer;
    NSMutableArray *_items;
    NSMutableArray *_bullets;
    CGPoint _touchLocation;
}

+(CCScene *) scene;

@end
