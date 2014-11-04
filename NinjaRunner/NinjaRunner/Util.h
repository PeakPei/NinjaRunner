//
//  Util.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/4/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

static const int BackgroundSpeed = -150;
static const CGFloat BackgroundLandHeightPercent = 0.15;

static const float NinjaPositionXPercent = 0.15;
static const float NinjaJumpVelocityMultiplier = 1.7;

static const int EnemySpeed = 100;

static NSString *BackgroundName = @"Background";
static NSString *BackgroundSpriteName = @"BackgroundImage";

static NSString *GroundName = @"Ground";

typedef NS_OPTIONS(NSUInteger, CollisionCategory) {
    CollisionCategoryEnemy = 1 << 0,
    CollisionCategoryNinja = 1 << 1,
    CollisionCategoryGround = 1 << 2
};

@interface Util : NSObject

@end
