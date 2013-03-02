//
//  MainScene.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/03/01.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"
#import "GameScene.h"


@implementation MainScene

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene {
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainScene *layer = [MainScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id)init {
    if (self = [super init]) {
        [CCMenuItemFont setFontSize:20];
		[CCMenuItemFont setFontName:@"Helvetica"];
		CCMenuItem *start = [CCMenuItemFont itemWithString:@"Start Game"
												target:self selector:@selector(startGame:)];
        CCMenu *menu = [CCMenu menuWithItems:start, nil];
		[menu alignItemsVertically];
		[self addChild:menu];
    }
    return self;
}

- (void)startGame:(id)sender
{
    CCTransitionFade *tran = [CCTransitionFade transitionWithDuration:1.0 scene:[GameScene scene] withColor:ccc3(255, 255, 255)];
    // GameSceneから頻繁に行き来することはないので、replaceScene(メモリから破棄する。)
    [[CCDirector sharedDirector] replaceScene:tran];
}

@end
