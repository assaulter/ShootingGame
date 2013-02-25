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
    // TODO: actionWithDurationをちゃんと計算すること。
    return [CCMoveTo actionWithDuration:5.0f position:ccp(bullet.position.x, winSize.height + bullet.contentSize.height/2)];
}

-(id)getAnimation2:(BulletNormal *)bullet {
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    // 目標地点をちゃんと計算すると斜め方向に射撃したっぽくなる。
    return [CCMoveTo actionWithDuration:5.0f position:ccp(bullet.position.x + bullet.contentSize.width * 4, winSize.height + bullet.contentSize.height/2)];
    // こうすると直線運動なので、スタート地点をずらしてあげるだけで幅広ショットができる。
//    return [CCMoveTo actionWithDuration:5.0f position:ccp(bullet.position.x, winSize.height + bullet.contentSize.height/2)];
}

@end
