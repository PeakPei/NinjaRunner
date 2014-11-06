//
//  Util.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/4/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

static const CGFloat GravityMultiplier = 0.025;

static const NSInteger BackgroundSpeed = -150;
static const CGFloat BackgroundLandHeightPercent = 0.15;

static const CGFloat MarginPercent = 0.013;

static const CGFloat FlyingEnemyYPercent = 0.80;

static const CGFloat ChargeAttackDuration = 1.0;

static const NSTimeInterval EnemySpawnTimeInterval = 2.7;
static const CGFloat DragonVelocityX = -150;
static const NSInteger DragonHealth = 60;

static const CGFloat NinjaPositionXPercent = 0.15;
static const CGFloat NinjaJumpVelocityMultiplier = 1.6;
static const NSInteger NinjaDamage = 20;
static const NSTimeInterval NinjaPowerAttackDuration = 5;

static const NSInteger ProjectileVelocityX = 500;

static NSString *BackgroundName = @"Background";
static NSString *BackgroundSpriteName = @"BackgroundImage";

static NSString *GroundName = @"Ground";

static NSString *ChargingNodeName = @"ChargingNode";
static NSString *ChargingLabelText = @"Charging...";
static NSString *ChargedLabelText = @"Charged!";
static NSString *PowerAttackText = @"Power Attack!";
static NSString *PowerAttackOnCdText = @"Cooldown";

static NSString *ChargedProjectileFilePath;

typedef NS_ENUM(NSUInteger, EnemyType) {
    EnemyTypeDragon
};

typedef NS_OPTIONS(NSUInteger, CollisionCategory) {
    CollisionCategoryEnemy = 1 << 0,
    CollisionCategoryNinja = 1 << 1,
    CollisionCategoryGround = 1 << 2,
    CollisionCategoryProjectile = 1 << 3
};

@interface Util : NSObject

@end
