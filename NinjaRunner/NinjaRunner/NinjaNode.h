//
//  NinjaNode.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/3/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static NSString *NinjaJumpActionKey = @"Jump";

@interface NinjaNode : SKSpriteNode

+ (instancetype) ninjaWithPosition:(CGPoint)position inScene:(SKScene *)scene;

@property (nonatomic, assign) NSInteger jumpsInProgressCount;
@property (nonatomic, assign) NSInteger damage;
@property (nonatomic, assign) NSTimeInterval powerAttackCooldown;
@property (nonatomic, assign) NSTimeInterval lastPowerAttackAgo;
@property (nonatomic, assign) BOOL powerAttackUsedAfterCd;

- (void) jump;
- (void) attack;
- (void) die;
- (void) chargeAttack;
- (void) enablePowerAttack;

@end
