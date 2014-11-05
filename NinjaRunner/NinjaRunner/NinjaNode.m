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

@property SKAction *runAnimation;
@property SKAction *jumpAnimation;

@property float jumpVelocityY;

@end

@implementation NinjaNode

+(instancetype) ninjaWithPosition:(CGPoint)position inScene:(SKScene *)scene {
    NinjaNode *ninja = [self spriteNodeWithImageNamed:@"ninja_run_1"];
    ninja.position = position;
    ninja.jumpVelocityY = scene.frame.size.height * NinjaJumpVelocityMultiplier;
    ninja.jumpsInProgressCount = 0;
    
    [ninja setupPhysicsBody];
    [ninja setupRunAnimation];
    [ninja setupJumpAnimation];
    
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

- (void) jump {
    // Allow only 2 jumps at a time
    if (_jumpsInProgressCount < 2) {
        _jumpsInProgressCount++;
    
        self.physicsBody.velocity = CGVectorMake(0, _jumpVelocityY);
        [self runAction:_jumpAnimation withKey:NinjaJumpActionKey];
    }
}

- (void) attack {
    CGPoint projectilePosition = CGPointMake(self.position.x + self.frame.size.width / 2,
                                             self.position.y + self.frame.size.height / 2);
    ProjectileNode *projectile = [ProjectileNode projectileAtPosition:projectilePosition];
    [self.parent addChild:projectile];
}

//-(void) attachSecondJumpLayer{
//    SKTexture *jumpTexture = [SKTexture textureWithImageNamed:@"ninja_jump_2"];
//    [self setTexture:jumpTexture];
//}

//-(void) jumpLower{
//    NSArray *jumpTextures = @[
//                              [SKTexture textureWithImageNamed:@"ninja_jump_low_1"],
//                              [SKTexture textureWithImageNamed:@"ninja_jump_low_2"],
//                              [SKTexture textureWithImageNamed:@"ninja_jump_low_3"]
//                              ];
//    SKTexture *jumpTexture = [SKTexture textureWithImageNamed:@"ninja_jump_low_1"];
//    [self setTexture:jumpTexture];
//    
//    self.position = CGPointMake(150, 160);
//    SKAction *jumpingLowNinjaAnimation = [SKAction animateWithTextures:jumpTextures timePerFrame:0.07];
//    [self runAction:[SKAction repeatAction:jumpingLowNinjaAnimation count:1]];
//
//}

//-(void)jumpWithFactor:(float)factor{
//    self.physicsBody.velocity = CGVectorMake(0.0, 500*factor);
//}

@end
