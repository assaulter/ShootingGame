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
+(CCScene *) scene
{
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
        _player = [CCSprite spriteWithFile:@"Player.png"];
        _player.position = ccp(winSize.width/2, _player.contentSize.height/2);
        [self addChild:_player];
    }
    return self;
}

//
-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Choose one of the touches to work with
    CGPoint location = [self getLocationFromTouches:touches];
    [self movePlayerToPoint:location];
}

// UITouchから、Pointに変換して返すヘルパー関数
-(CGPoint)getLocationFromTouches:(NSSet*)touches {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    return [[CCDirector sharedDirector] convertToGL:location];
}

// プレイヤーをtouchした位置に移動する
-(void)movePlayerToPoint:(CGPoint)point {
    int offX = point.x - _player.position.x;
    int offY = point.y - _player.position.y;
    float length = sqrtf((offX*offX)+(offY*offY));
    NSLog(@"offx, offy: %d, %d", offX, offY);
    [_player runAction:[CCSequence actions:[CCMoveTo actionWithDuration:length/VELOCITY position:point], nil]];
}

@end
