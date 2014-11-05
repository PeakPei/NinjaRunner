//
//  Util.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/4/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

static const float GravityMultiplier = 0.025;

static const int BackgroundSpeed = -150;
static const CGFloat BackgroundLandHeightPercent = 0.15;

static const float MarginPercent = 0.013;

static const float ButtonSizePercent = 0.09;

static const float NinjaPositionXPercent = 0.15;
static const float NinjaJumpVelocityMultiplier = 1.6;

static const int ProjectileVelocityX = 1500;

static NSString *BackgroundName = @"Background";
static NSString *BackgroundSpriteName = @"BackgroundImage";

static NSString *GroundName = @"Ground";

static NSString *ButtonJumpName = @"ButtonJump";
static NSString *ButtonAttackName = @"ButtonAttack";
static NSString *ButtonSpecialAttackName = @"ButtonSpecialAttack";

typedef NS_OPTIONS(NSUInteger, CollisionCategory) {
    CollisionCategoryEnemy = 1 << 0,
    CollisionCategoryNinja = 1 << 1,
    CollisionCategoryGround = 1 << 2
};

@interface Util : NSObject

@end
