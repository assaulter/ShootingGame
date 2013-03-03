//
//  Observer.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/03/03.
//
//

#import <Foundation/Foundation.h>

@protocol Observer <NSObject>

@required
-(void)update:(CGPoint)point isTouches:(BOOL)isTouches;

@end
