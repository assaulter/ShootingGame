//
//  GamePadLayer.m
//  ShootingGame
//
//  Created by KazukiKubo on 2013/02/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "GamePadLayer.h"


@implementation GamePadLayer

-(id)init {
    if (self = [super init]) {
        self.isTouchEnabled = YES;
        _observers = [NSMutableArray new];
    }
    return self;
}

-(void)addObserver:(id<Observer>)observer {
    [_observers addObject:observer];
}

-(void)deleteObserver:(id<Observer>)observer {
    [_observers removeObject:observer];
}

-(void)notifyObservers {
    for (id<Observer> observer in _observers) {
        [observer update:self.touchLocation];
    }
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Choose one of the touches to work with
    CGPoint location = [self getLocationFromTouches:touches];
    self.touchLocation = location;
//    [self notifyObservers];
    self.isTouches = YES;
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint location = [self getLocationFromTouches:touches];
    self.touchLocation = location;
//    [self notifyObservers];
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.isTouches = NO;
}

// UITouchから、Pointに変換して返すヘルパー関数
-(CGPoint)getLocationFromTouches:(NSSet*)touches {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    return [[CCDirector sharedDirector] convertToGL:location];
}

@end
