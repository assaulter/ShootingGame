//
//  ParallelPattern.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/25.
//
//

#import "ParallelPattern.h"

@implementation ParallelPattern

@synthesize delegate;

-(NSArray*)createBullet:(CGPoint)playerPosition {
    BulletNormal *bullet1 = [[BulletNormal alloc] init];
    BulletNormal *bullet2 = [[BulletNormal alloc] init];
    BulletNormal *bullet3 = [[BulletNormal alloc] init];
    
    NSArray *bullets = [[NSArray alloc] initWithObjects:bullet1, bullet2, bullet3, nil];
    CGFloat space = bullet1.contentSize.width * 3;
    int i = -1;
    
    for (BulletNormal *bullet in bullets) {
        bullet.position = ccp(playerPosition.x + (space * i), playerPosition.y);
        bullet.tag = SpriteTagsBullet;
        [self.delegate addBulletToLayer:bullet];
        i++;
    }
    
    // create actions
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    id actionMove1 = [CCMoveTo actionWithDuration:3.0f position:ccp(bullet1.position.x, winSize.height + bullet1.contentSize.height/2)];
    id actionMove2 = [CCMoveTo actionWithDuration:3.0f position:ccp(bullet2.position.x, winSize.height + bullet2.contentSize.height/2)];
    id actionMove3 = [CCMoveTo actionWithDuration:3.0f position:ccp(bullet3.position.x, winSize.height + bullet3.contentSize.height/2)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self.delegate selector:@selector(spriteMoveFinished:)];
    
    for (BulletNormal *bullet in bullets) {
        [bullet stopAllActions];
    }
    
    [bullet1 runAction:[CCSequence actions:actionMove1, actionMoveDone, nil]];
    [bullet2 runAction:[CCSequence actions:actionMove2, actionMoveDone, nil]];
    [bullet3 runAction:[CCSequence actions:actionMove3, actionMoveDone, nil]];
    return bullets;
}


@end
