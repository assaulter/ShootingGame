//
//  Subject.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/03/03.
//
//

#import <Foundation/Foundation.h>
#import "Observer.h"

@protocol Subject <NSObject>

@required
-(void)addObserver:(id<Observer>)observer;
-(void)deleteObserver:(id<Observer>)observer;
-(void)notifyObservers;

@end
