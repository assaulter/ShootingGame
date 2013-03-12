//
//  GameScene.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"
#import "Item.h"
#import "ParallelPattern.h"
#import "NormalPattern.h"
#import "ThreeWayPattern.h"
#import "CollisionDetector.h"
#import "NextStage.h"
#import "GameOverScene.h"

@implementation GameScene

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene {
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameScene *layer = [GameScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id)init {
    if (self = [super initWithColor:ccc4(255,255,255,255)]) {
        _items = [NSMutableArray new];
        _bullets = [NSMutableArray new];
        // player関連を持つlayer
        _playerLayer = [[PlayerLayer alloc] init];
        [self addChild:_playerLayer z:0];
        // item関連を持つlayer
        _itemLayer = [[ItemLayer alloc] init];
        [self addChild:_itemLayer z:1];
        // 敵関連を持つlayer
        _enemyLayer = [[EnemyLayer alloc] init];
        [self addChild:_enemyLayer z:2];
        // ボスを持つlayer
        _bossLayer = [[BossLayer alloc] init];
        [self addChild:_bossLayer z:3];
        // ユーザーの操作を受けるlayer
        GamePadLayer *gamePadLayer = [[GamePadLayer alloc] init];
        [gamePadLayer addObserver:_playerLayer];
        [self addChild:gamePadLayer z:4];

        [self schedule:@selector(update:)];
    }
    return self;
}

// 今のところ当たり判定君, @param dt : 1/60sec
-(void)update:(ccTime)dt {
    NSMutableArray *spritesToDelete = [NSMutableArray new];
    Player *player = _playerLayer.player;
    // itemとplayerの当たり判定
    for (Item *item in _itemLayer.items) {
        if ([CollisionDetector isCollided:player item:item]) {
            [spritesToDelete addObject:item];
            // playerの状態を変化させる。
            [self changeBulletPattern:item.type];
        }
    }
    // 敵と弾の当たり判定
    for (CCSprite *enemy in _enemyLayer.enemies) {
        for (CCSprite *bullet in _playerLayer.bullets) {
            if ([CollisionDetector isCollided:enemy sprite:bullet]) {
                [spritesToDelete addObject:enemy];
                [spritesToDelete addObject:bullet];
                [_itemLayer addItemWithEnemyPosition:enemy.position];
            }
        }
    }
    // bossとの当たり判定
    Boss *boss = _bossLayer.boss;
    if ([CollisionDetector isCollided:player sprite:boss]) {
        [self goToGameOverScene];
    }
    // あたったやつは削除
    [self deleteSprites:spritesToDelete];
}

// 削除用バッファからtagごとに削除を行う。
-(void)deleteSprites:(NSMutableArray*)sprites {
    for (CCSprite *sprite in sprites) {
        switch (sprite.tag) {
            case SpriteTagsItem:
                [_itemLayer.items removeObject:sprite];
                [_itemLayer removeChild:sprite cleanup:YES];
                break;
            case SpriteTagsBullet:
                [_playerLayer.bullets removeObject:sprite];
                [_playerLayer removeChild:sprite cleanup:YES];
                break;
            case SpriteTagsEnemy:
                [_enemyLayer.enemies removeObject:sprite];
                [_enemyLayer removeChild:sprite cleanup:YES];
                break;
            default:
                break;
        }
    }
}

// 弾の発射パターンを変更する。
-(void)changeBulletPattern:(ItemType)itemType {
    switch (itemType) {
        case ItemTypeParallel:
            [_playerLayer setBulletPattern:[ParallelPattern new]];
            break;
        case ItemTypeNormal:
            [_playerLayer setBulletPattern:[NormalPattern new]];
            break;
        case ItemTypeThreeWay:
            [_playerLayer setBulletPattern:[ThreeWayPattern new]];
        default:
            break;
    }
}

// 次のステージへ移動する。
-(void)goToNextStage {
    [self unschedule:@selector(update:)];
    
    CCTransitionFade *tran = [CCTransitionFade transitionWithDuration:1.0 scene:[NextStage scene] withColor:ccc3(255, 255, 255)];
    [[CCDirector sharedDirector]replaceScene:tran];
}

-(void)goToGameOverScene {
    [self unschedule:@selector(update:)];
    
    CCTransitionFade *tran = [CCTransitionFade transitionWithDuration:1.0 scene:[GameOverScene scene] withColor:ccc3(255, 255, 255)];
    [[CCDirector sharedDirector]replaceScene:tran];
}

@end
