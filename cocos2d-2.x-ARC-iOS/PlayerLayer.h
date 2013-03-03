//
//  PlayerLayer.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "BulletPattern.h"
#import "Observer.h"

// プレイヤーに関連するものを管理するレイヤー
@interface PlayerLayer : CCLayer<BulletPatternDelegate, Observer> {
    NSObject<BulletPattern> *_bulletPattern;
    CGPoint _touchLocation;
    BOOL _isTouches;
}

@property(nonatomic, strong) Player *player; // player(GameSceneから参照するために)
@property(nonatomic, strong) NSMutableArray *bullets; // 弾を持つ配列(当たり判定は別クラスでやるので)

-(void)setBulletPattern:(NSObject<BulletPattern> *)bulletPattern;

@end
