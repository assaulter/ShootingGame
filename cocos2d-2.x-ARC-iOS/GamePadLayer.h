//
//  GamePadLayer.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Subject.h"

// ユーザーの入力を受けるクラス
@interface GamePadLayer : CCLayer<Subject> {
    NSMutableArray *_observers;
}

@property(nonatomic, assign) CGPoint touchLocation;
@property(nonatomic, assign) BOOL isTouches;

@end
