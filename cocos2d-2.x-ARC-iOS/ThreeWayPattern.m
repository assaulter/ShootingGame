//
//  ThreeWayPattern.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/25.
//
//

#import "ThreeWayPattern.h"

const float DURATION = 3.0f;

@implementation ThreeWayPattern

@synthesize delegate;

-(NSArray*)createBullet:(CGPoint)playerPosition {
    BulletNormal *bullet1 = [[BulletNormal alloc] init];
    BulletNormal *bullet2 = [[BulletNormal alloc] init];
    BulletNormal *bullet3 = [[BulletNormal alloc] init];
    
    NSArray *bullets = [[NSArray alloc] initWithObjects:bullet1, bullet2, bullet3, nil];
    
    for (BulletNormal *bullet in bullets) {
        bullet.position = playerPosition;
        bullet.tag = SpriteTagsBullet;
        [self.delegate addBulletToLayer:bullet];
    }
    
    // create actions
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    id actionMove1 = [CCMoveTo actionWithDuration:DURATION position:ccp(bullet1.position.x, winSize.height + bullet1.contentSize.height/2)];
    id actionMove2 = [CCMoveTo actionWithDuration:DURATION position:ccp(bullet2.position.x + bullet2.contentSize.width * 3, winSize.height + bullet2.contentSize.height/2)];
    id actionMove3 = [CCMoveTo actionWithDuration:DURATION position:ccp(bullet3.position.x - bullet3.contentSize.width * 3, winSize.height + bullet3.contentSize.height/2)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self.delegate selector:@selector(spriteMoveFinished:)];
    
    [bullet1 runAction:[CCSequence actions:actionMove1, actionMoveDone, nil]];
    [bullet2 runAction:[CCSequence actions:actionMove2, actionMoveDone, nil]];
    [bullet3 runAction:[CCSequence actions:actionMove3, actionMoveDone, nil]];
    return bullets;
}

@end
