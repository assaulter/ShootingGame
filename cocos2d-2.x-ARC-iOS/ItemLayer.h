//
//  ItemLayer.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Item.h"

@interface ItemLayer : CCLayer {
    NSMutableArray *_itemTypes;
}

@property(nonatomic, strong) NSMutableArray *items;

-(void)addItemWithEnemyPosition:(CGPoint)position;

@end
