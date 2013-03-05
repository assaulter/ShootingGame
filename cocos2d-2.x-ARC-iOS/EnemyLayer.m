//
//  EnemyLayer.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "EnemyLayer.h"
#import "Enemy.h"

@implementation EnemyLayer

-(id)init {
    if (self = [super init]) {
        self.enemies = [NSMutableArray new];
        [self schedule:@selector(addEnemy:) interval:3.0f];
        _factory = [EnemyFactory new];
        _factory.delegate = self;
    }
    return self;
}

-(void)addEnemy:(ccTime)dt {
    EnemyProduct *enemy = [_factory createProductFromEnemyType:EnemyTypeNormal];
    [self initEnemyPosition:enemy];
    NSArray *animations = [_factory getAnimationsFromEnemyType:EnemyTypeNormal enemy:enemy];
    
    [self addChild:enemy];
    [self.enemies addObject:enemy];
    // TODO: マジックナンバー
    [enemy runAction:[CCSequence actions:animations[0], animations[1], nil]];
}

-(void)initEnemyPosition:(EnemyProduct*)enemy {
    // Determine where to spawn the target along the X axis
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int minX = enemy.contentSize.width/2;
    int maxX = winSize.width - minX;
    int rangeX = maxX - minX;
    int actualX = (arc4random() % rangeX) + minX;
    
    enemy.position = ccp(actualX, winSize.height + (enemy.contentSize.height/2));
    enemy.tag = SpriteTagsEnemy;
}

#pragma mark - EnemyFactoryDelegate method
// アニメーションが終了した時の処理 = 画面から消えたとき
-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    if (sprite.tag == SpriteTagsEnemy) {
        [self.enemies removeObject:sprite];
    }
    [self removeChild:sprite cleanup:YES];
}

@end
