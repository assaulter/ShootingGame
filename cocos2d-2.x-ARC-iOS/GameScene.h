//
//  GameScene.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"

@interface GameScene : CCLayerColor {
    Player *_player;
    NSMutableArray *_items;
    NSMutableArray *_bullets;
    BOOL _isTouches;
    CGPoint _touchLocation;
}

+(CCScene *) scene;

@end
