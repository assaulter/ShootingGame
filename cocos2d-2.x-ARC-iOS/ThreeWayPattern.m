//
//  ThreeWayPattern.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/25.
//
//

#import "ThreeWayPattern.h"

@implementation ThreeWayPattern

@synthesize delegate;

-(BulletNormal*)addBullet:(CGPoint)playerPosition {
    BulletNormal *bullet = [[BulletNormal alloc] init];
    
    bullet.position = playerPosition;
    [self.delegate addChild:bullet];
    
    bullet.tag = 2;
    
    // create actions
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    id actionMove = [CCMoveTo actionWithDuration:5.0f position:ccp(bullet.position.x, winSize.height + bullet.contentSize.height/2)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self.delegate selector:@selector(spriteMoveFinished:)];
    
    [bullet runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
    return bullet;
}

@end
