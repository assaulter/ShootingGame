//
//  ItemLayer.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "ItemLayer.h"
#import "Item.h"

@implementation ItemLayer

-(id)init {
    if (self = [super init]) {
        self.items = [NSMutableArray new];
        _itemTypes = [self setTypesToArray];
    }
    return self;
}

//TODO: type増やしたらここも書き換えないといけない・・・
-(NSMutableArray*)setTypesToArray {
    NSNumber *normal = [NSNumber numberWithInt:ItemTypeNormal];
    NSNumber *parallel = [NSNumber numberWithInt:ItemTypeParallel];
    NSNumber *threeway = [NSNumber numberWithInt:ItemTypeThreeWay];
    
    return [[NSMutableArray alloc] initWithObjects:normal, parallel, threeway, nil];
}

// add item with enemyPosition to self Layer
-(void)addItemWithEnemyPosition:(CGPoint)position {
    Item *item = [self getItemWithType:[self getItemTypeRand]];
    item.position = position;
    [self addChild:item];
    
    // save item to MutableArray
    item.tag = SpriteTagsItem;
    [self.items addObject:item];
    
    // create actions
    id actionMove = [CCMoveTo actionWithDuration:10.0f
                                        position:ccp(position.x, -item.contentSize.height/2)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self
                                             selector:@selector(spriteMoveFinished:)];
    [item runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

-(ItemType)getItemType:(int)number {
    ItemType type = [[_itemTypes objectAtIndex:number] intValue];
    return type;
}

// randamなitemTypeを返すメソッド
-(ItemType)getItemTypeRand {
    ItemType type = [self getItemType:(arc4random() % [_itemTypes count])];
    return type;
}

// typeに応じたitemを生成する。
-(Item*)getItemWithType:(ItemType)type {
    Item *item;
    switch (type) {
        case ItemTypeNormal:
            item = [Item spriteWithFile:@"Normal.png"];
            item.type = type;
            break;
        case ItemTypeParallel:
            item =  [Item spriteWithFile:@"Parallel.png"];
            item.type = type;
            break;
        case ItemTypeThreeWay:
            item = [Item spriteWithFile:@"Threeway.png"];
            item.type = type;
            break;
        default:
            break;
    }
    return item;
}

// アニメーションが終了した時の処理 = 画面から消えたとき
-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    if (sprite.tag == SpriteTagsItem) {
        [self.items removeObject:sprite];
    }
    [self removeChild:sprite cleanup:YES];
}

@end
