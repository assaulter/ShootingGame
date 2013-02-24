//
//  ConcreteStrategy.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "ConcreteStrategy.h"


@implementation ConcreteStrategy

-(id)getAnimation:(BulletNormal*)bullet {
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    return [CCMoveTo actionWithDuration:5.0f position:ccp(bullet.position.x, winSize.height + bullet.contentSize.height/2)];
}

@end
