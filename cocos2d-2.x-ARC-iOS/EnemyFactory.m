//
//  EnemyFactory.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/03/04.
//
//

#import "EnemyFactory.h"

@implementation EnemyFactory

-(EnemyProduct*)createProductFromEnemyType:(EnemyType)type {
    EnemyProduct *product = nil;
    switch (type) {
        case EnemyTypeNormal:
            product = [CCSprite spriteWithFile:@"Target.png"];
            break;
        case EnemyTypeSlow:
            product = [CCSprite spriteWithFile:@"Target2.png"];
            break;
        case EnemyTypeFast:
            product = [CCSprite spriteWithFile:@"Target3.png"];
            break;
        default:
            break;
    }
    return product;
}

-(NSArray*)getAnimationsFromEnemyType:(EnemyType)type enemy:(EnemyProduct*)enemy {
    id actionMove, actionMoveDone;
    switch (type) {
        case EnemyTypeNormal:
            actionMove = [CCMoveTo actionWithDuration:5.0f
                                                position:ccp(enemy.position.x, -enemy.contentSize.height/2)];
            actionMoveDone = [CCCallFuncN actionWithTarget:self.delegate
                                                     selector:@selector(spriteMoveFinished:)];
            break;
        case EnemyTypeSlow:
            actionMove = [CCMoveTo actionWithDuration:10.0f
                                             position:ccp(enemy.position.x, -enemy.contentSize.height/2)];
            actionMoveDone = [CCCallFuncN actionWithTarget:self.delegate
                                                  selector:@selector(spriteMoveFinished:)];
            break;
        case EnemyTypeFast:
            actionMove = [CCMoveTo actionWithDuration:2.5f
                                             position:ccp(enemy.position.x, -enemy.contentSize.height/2)];
            actionMoveDone = [CCCallFuncN actionWithTarget:self.delegate
                                                  selector:@selector(spriteMoveFinished:)];
            break;
        default:
            break;
    }
    return [[NSArray alloc] initWithObjects:actionMove, actionMoveDone, nil];
}

@end
