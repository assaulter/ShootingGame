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

// プレイヤーに関連するものを管理するレイヤー
@interface PlayerLayer : CCLayer {
}

@property(nonatomic, strong) Player *player; // player(GameSceneから参照するために)
@property(nonatomic, strong) NSMutableArray *bullets; // 弾を持つ配列(当たり判定は別クラスでやるので)

// winSizeを受け取る・・・どっちでもいいと思うけどね。
-(id)initWithWinSize:(CGSize)winSize;

@end
