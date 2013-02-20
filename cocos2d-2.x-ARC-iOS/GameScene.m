//
//  GameScene.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"

static const float VELOCITY = 400; // 400pixel per 1sec

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
        self.isTouchEnabled = YES;
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        _player = [[Player alloc]init];
        _player.position = ccp(winSize.width/2, _player.contentSize.height/2);
        _items = [NSMutableArray new];
        _bullets = [NSMutableArray new];
        
        [self addChild:_player];
        [self schedule:@selector(addItem:) interval:3.0f];
        [self schedule:@selector(addBullet:) interval:1.0f];
        [self schedule:@selector(update:)];
    }
    return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Choose one of the touches to work with
    CGPoint location = [self getLocationFromTouches:touches];
    _touchLocation = location;
    _isTouches = YES;
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint location = [self getLocationFromTouches:touches];
    _touchLocation = location;
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    _isTouches = NO;
}

// UITouchから、Pointに変換して返すヘルパー関数
-(CGPoint)getLocationFromTouches:(NSSet*)touches {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    return [[CCDirector sharedDirector] convertToGL:location];
}

// プレイヤーをtouchした位置に移動させる(runActionを使わないバージョン)
-(void)movePlayer {
    // 長さ1に正規化されたベクトル
    CGPoint v = ccpNormalize(ccpSub(_touchLocation, _player.position));
    _player.position = ccpAdd(v, _player.position);
}

// 今のところ当たり判定君, @param dt : 1/60sec
-(void)update:(ccTime)dt {
    if (_isTouches) {
        [self movePlayer];
    }
    
    NSMutableArray *itemsToDelete = [NSMutableArray new];
    CGRect playerRect = CGRectMake(_player.position.x - (_player.contentSize.width/2), _player.position.y - (_player.contentSize.height/2), _player.contentSize.width, _player.contentSize.height);
        
    for (CCSprite *item in _items) {
        CGRect itemRect = CGRectMake(item.position.x - (item.contentSize.width/2), item.position.y - (item.contentSize.height/2), item.contentSize.width, item.contentSize.height);
        if (CGRectIntersectsRect(playerRect, itemRect)) { // itemとplayerが接触した。
            [itemsToDelete addObject:item];
            // playerの状態を変化させる。
            _player.scale += 0.1f;
        }
    }
    
    for (CCSprite *item in itemsToDelete) {
        [_items removeObject:item];
        [self removeChild:item cleanup:YES];
    }
}

// add items
-(void)addItem:(ccTime)dt {
    CCSprite *item = [CCSprite spriteWithFile:@"Projectile.png"];
    
    // Determine where to spawn the target along the X axis
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int minX = item.contentSize.width/2;
    int maxX = winSize.width - minX;
    int rangeX = maxX - minX;
    int actualX = (arc4random() % rangeX) + minX;
    
    item.position = ccp(actualX, winSize.height + (item.contentSize.height/2));
    [self addChild:item];
    
    // save item to MutableArray
    item.tag = 1;
    [_items addObject:item];
    
    // create actions
    id actionMove = [CCMoveTo actionWithDuration:10.0f
                                        position:ccp(actualX, -item.contentSize.height/2)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self
                                             selector:@selector(spriteMoveFinished:)];
    [item runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

// add bullets
-(void)addBullet:(ccTime)dt {
    CCSprite *bullet = [CCSprite spriteWithFile:@"Projectile2.jpg"];
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    bullet.position = _player.position;
    [self addChild:bullet];
    
    bullet.tag = 2;
    [_bullets addObject:bullet];
    
    // create actions
    id actionMove = [CCMoveTo actionWithDuration:5.0f position:ccp(bullet.position.x, winSize.height + bullet.contentSize.height/2)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)];
    [bullet runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

// アニメーションが終了した時の処理 = 画面から消えたとき
-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    if (sprite.tag == 1) {
        [_items removeObject:sprite];
    } else if (sprite.tag == 2) {
        [_bullets removeObject:sprite];
    }
    [self removeChild:sprite cleanup:YES];
}

@end
