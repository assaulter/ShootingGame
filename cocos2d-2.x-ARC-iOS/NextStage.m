//
//  NextStage.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/28.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "NextStage.h"


@implementation NextStage

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	NextStage *layer = [NextStage node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id)init {
    if (self = [super initWithColor:ccc4(255,255,255,255)]) {
        
    }
    return self;
}

@end
