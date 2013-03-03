//
//  PlayerLayer.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "PlayerLayer.h"
// TODO: 次は弾のインタフェースを作ろう
#import "BulletNormal.h"
#import "NormalPattern.h" // デフォルトの発射パターン

@implementation PlayerLayer

-(id)init {
    if (self = [super init]) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        self.bullets = [NSMutableArray new];
        self.player = [Player new];
        CGPoint initPosition = ccp(winSize.width/2, self.player.contentSize.height/2);
        self.player.position = initPosition;
        _touchLocation = initPosition;

        // bulletPatternを生成
        _bulletPattern = [NormalPattern new];
        _bulletPattern.delegate = self;

        [self addChild:self.player];
        [self schedule:@selector(addBullet:) interval:1.0f];
        [self schedule:@selector(movePlayer:)];
    }
    return self;
}

// プレイヤーをtouchした位置に移動させる(runActionを使わないバージョン)
-(void)movePlayer:(ccTime)dt {
    if (_isTouches) {
        // 長さ1に正規化されたベクトル
        CGPoint v = ccpNormalize(ccpSub(_touchLocation, self.player.position));
        self.player.position = ccpAdd(v, self.player.position);
        NSLog(@"player position x %f y %f", self.player.position.x, self.player.position.y);
    }
}

// 実際に弾を撃ってるところ
-(void)addBullet:(ccTime)dt {
    NSArray *createdBullets = [_bulletPattern createBullet:self.player.position];
    for (BulletNormal *bullet in createdBullets) {
        [self.bullets addObject:bullet];
    }
}

// アニメーションが終了した時の処理 = 画面から消えたとき(bulletPatternから呼ばれる)
-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    if (sprite.tag == SpriteTagsBullet) {
        [self.bullets removeObject:sprite];
    }
    [self removeChild:sprite cleanup:YES];
}

// 状態を設定してもらう。
-(void)setBulletPattern:(NSObject<BulletPattern>*)bulletPattern {
    _bulletPattern = bulletPattern;
    _bulletPattern.delegate = self;
}

#pragma mark - bulletPatternDelegate
-(void)addBulletToLayer:(BulletNormal*)bullet {
    [self addChild:bullet];
}

#pragma mark - observer protocol
-(void)update:(CGPoint)point isTouches:(BOOL)isTouches {
    _touchLocation = point;
    _isTouches = isTouches;
}

@end
