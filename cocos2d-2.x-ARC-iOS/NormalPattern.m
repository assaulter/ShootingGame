//
//  NormalPattern.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/25.
//
//

#import "NormalPattern.h"

@implementation NormalPattern

@synthesize delegate;

-(NSArray*)createBullet:(CGPoint)playerPosition; {
    BulletNormal *bullet = [[BulletNormal alloc] init];
    
    bullet.position = playerPosition;
    [self.delegate addBulletToLayer:bullet];
    
    bullet.tag = SpriteTagsBullet;
    
    // create actions
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    id actionMove = [CCMoveTo actionWithDuration:3.0f position:ccp(bullet.position.x, winSize.height + bullet.contentSize.height/2)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self.delegate selector:@selector(spriteMoveFinished:)];
    
    [bullet runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
    NSArray *bullets = [[NSArray alloc] initWithObjects:bullet, nil];
    return bullets;
}

@end
