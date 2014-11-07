//
//  NinjaNode.m
//  NinjaRunner
//
//  Created by Gabriela Angelova on 11/3/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "NinjaNode.h"
#import "Util.h"
#import "ProjectileNode.h"

@interface NinjaNode ()

@property (nonatomic, strong) SKAction *runAnimation;
@property (nonatomic, strong) SKAction *jumpAnimation;
@property (nonatomic, strong) SKAction *attackAnimation;
@property (nonatomic, strong) SKAction *dyingAnimation;

@property (nonatomic, assign) float jumpVelocityY;

@property (nonatomic, assign) BOOL isCharged;
@property (nonatomic, assign) BOOL isPowerAttackEnabled;

@end

@implementation NinjaNode

+ (instancetype) ninjaWithPosition:(CGPoint)position inScene:(SKScene *)scene {
    NinjaNode *ninja = [self spriteNodeWithImageNamed:@"ninja_run_1"];
    ninja.position = position;
    ninja.jumpVelocityY = scene.frame.size.height * NinjaJumpVelocityMultiplier;
    ninja.jumpsInProgressCount = 0;
    ninja.damage = NinjaDamage;
    
    ninja.powerAttackCooldown = 20;
    ninja.lastPowerAttackAgo = 0;
    ninja.powerAttackUsedAfterCd = NO;
    
    [ninja setupPhysicsBody];
    [ninja setupRunAnimation];
    [ninja setupJumpAnimation];
    [ninja setupAttackAnimation];
    [ninja setupDyingAnimation];
    
    [ninja runAction:[SKAction repeatActionForever:ninja.runAnimation]];
    
    return ninja;
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.restitution = 0.0;
    self.physicsBody.categoryBitMask = CollisionCategoryNinja;
    self.physicsBody.collisionBitMask = CollisionCategoryGround;
    self.physicsBody.contactTestBitMask = CollisionCategoryEnemy | CollisionCategoryGround;
}

- (void) setupRunAnimation {
    NSArray *runTextures = @[[SKTexture textureWithImageNamed:@"ninja_run_1"],
                             [SKTexture textureWithImageNamed:@"ninja_run_2"],
                             [SKTexture textureWithImageNamed:@"ninja_run_3"],
                             [SKTexture textureWithImageNamed:@"ninja_run_4"],
                             [SKTexture textureWithImageNamed:@"ninja_run_5"],
                             [SKTexture textureWithImageNamed:@"ninja_run_6"],
                             [SKTexture textureWithImageNamed:@"ninja_run_7"],
                             [SKTexture textureWithImageNamed:@"ninja_run_8"]];
    
    _runAnimation = [SKAction animateWithTextures:runTextures timePerFrame:0.1];
}

- (void) setupJumpAnimation {
    NSArray *jumpTextures = @[[SKTexture textureWithImageNamed:@"ninja_jump_4"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_4"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_5"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_6"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_6"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_6"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_7"]];
    
    _jumpAnimation = [SKAction animateWithTextures:jumpTextures timePerFrame:0.15];
}

- (void) setupAttackAnimation {
    NSArray *attackTextures = @[[SKTexture textureWithImageNamed:@"ninja_attack_6"]];
    _attackAnimation = [SKAction animateWithTextures:attackTextures timePerFrame:0.08];
}

- (void) setupDyingAnimation {
    NSArray *dyingTextures = @[[SKTexture textureWithImageNamed:@"ninja_fall_1"],
                               [SKTexture textureWithImageNamed:@"ninja_fall_2"],
                               [SKTexture textureWithImageNamed:@"ninja_fall_3"],
                               [SKTexture textureWithImageNamed:@"ninja_fall_4"]];
    
    _dyingAnimation = [SKAction animateWithTextures:dyingTextures timePerFrame:0.1];
}

- (void) jump {
    // Allow only 2 jumps at a time
    if (_jumpsInProgressCount < 2) {
        _jumpsInProgressCount++;
    
        self.physicsBody.velocity = CGVectorMake(0, _jumpVelocityY);
        [self runAction:_jumpAnimation withKey:NinjaJumpActionKey];
    }
}

- (void) attack {
    CGPoint projectilePosition = CGPointMake(self.position.x + self.frame.size.width / 3,
                                             self.position.y + self.frame.size.height / 5);
    
    ProjectileNode *projectile = [ProjectileNode projectileAtPosition:projectilePosition];
    if (_isCharged || _isPowerAttackEnabled) {
        SKEmitterNode *chargedProjectile = [self createChargedProjectile];
        chargedProjectile.position = projectilePosition;
        [self.parent addChild:chargedProjectile];
        projectile.chargedEmitter = chargedProjectile;
    }
    
    projectile.damage = _isCharged || _isPowerAttackEnabled ? self.damage * ChargeAttackDamageMultiplier : self.damage;
    _isCharged = NO;
    
    [self runAction:_attackAnimation];
    [self.parent addChild:projectile];
}

- (void) die {
    [self removeAllActions];
    self.xScale = 0.95;
    self.yScale = 0.6;
    [self runAction:_dyingAnimation];
}

- (void) chargeAttack {
    _isCharged = YES;
}

- (void) enablePowerAttack {
    _isPowerAttackEnabled = YES;
    _powerAttackUsedAfterCd = YES;
    
    SKAction *disablePowerAttack = [SKAction runBlock:^{
        _isPowerAttackEnabled = NO;
    }];
    
    SKAction *sequence = [SKAction sequence:@[[SKAction waitForDuration:NinjaPowerAttackDuration],
                                              disablePowerAttack]];
    [self runAction:sequence];
}

- (SKEmitterNode *) createChargedProjectile {
    NSString *chargedProjectileFilePath = [[NSBundle mainBundle] pathForResource:@"ChargedProjectile" ofType:@"sks"];
    SKEmitterNode *chargedProjectile = [NSKeyedUnarchiver unarchiveObjectWithFile:chargedProjectileFilePath];
    chargedProjectile.zPosition = 1;
    chargedProjectile.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:1];
    chargedProjectile.physicsBody.affectedByGravity = NO;
    chargedProjectile.physicsBody.collisionBitMask = 0;
    chargedProjectile.physicsBody.contactTestBitMask = 0;
    chargedProjectile.physicsBody.velocity = CGVectorMake(ProjectileVelocityX, 0);

    return chargedProjectile;
}

@end
