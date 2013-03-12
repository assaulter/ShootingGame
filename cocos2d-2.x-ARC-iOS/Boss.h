//
//  Boss.h
//  ShootingGame
//
//  Created by KazukiKubo on 2013/03/05.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Boss : CCSprite {
    
}

@property(nonatomic, assign) int lifePoint;

-(id)initWithFile:(NSString *)filename lifePoint:(int)lifePoint;

@end
