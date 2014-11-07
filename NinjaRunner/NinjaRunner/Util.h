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

static const NSInteger BackgroundSpeed = -110;
static const CGFloat BackgroundLandHeightPercent = 0.15;

static const CGFloat MarginPercent = 0.013;

static const CGFloat ChargeAttackDuration = 1.0;
static const CGFloat ChargeAttackDamageMultiplier = 5;

static const NSTimeInterval EnemySpawnTimeInterval = 1.75;
static const NSInteger DragonSpawnChance = 10;
static const CGFloat DragonYPercent = 0.80;
static const CGFloat DragonVelocityX = -120;
static const NSInteger DragonHealth = 180;
static const NSInteger DragonPoints = 500;

static const CGFloat MonsterBullVelocityX = -250;
static const NSInteger MonsterBullHealth = 100;
static const NSInteger MonsterBullPoints = 30;

static const CGFloat EagleYPercent = 0.50;
static const CGFloat EagleVelocityX = -320;
static const NSInteger EagleHealth = 40;
static const NSInteger EaglePoints = 80;

static const CGFloat EarthDragonVelocityX = -200;
static const NSInteger EarthDragonHealth = 0;
static const NSInteger EarthDragonPoints = 0;

static const CGFloat NinjaPositionXPercent = 0.15;
static const CGFloat NinjaJumpVelocityMultiplier = 1.6;
static const NSInteger NinjaDamage = 30;
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

static NSString *ScoreLabelName = @"Score";

static NSString *ChargedProjectileFilePath;

static const NSInteger NumberOfTypes = 4;
typedef NS_ENUM(NSUInteger, EnemyType) {
    EnemyTypeDragon = 0,
    EnemyTypeMonsterBull = 1,
    EnemyTypeEagle = 2,
    EnemyTypeEarthDragon = 3
};

typedef NS_OPTIONS(NSUInteger, CollisionCategory) {
    CollisionCategoryEnemy = 1 << 0,
    CollisionCategoryNinja = 1 << 1,
    CollisionCategoryGround = 1 << 2,
    CollisionCategoryProjectile = 1 << 3
};

@interface Util : NSObject

@end
