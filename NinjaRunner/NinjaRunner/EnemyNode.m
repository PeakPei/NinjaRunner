//
//  EnemyNode.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/6/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "EnemyNode.h"
#import "Util.h"

@implementation EnemyNode

+ (instancetype)enemyWithImageNamed:(NSString *)image position:(CGPoint)position velocity:(CGVector)velocity health:(NSInteger)health {
    EnemyNode *enemy = [self spriteNodeWithImageNamed:image];
    
    enemy.position = position;
    enemy.health = health;
    
    [enemy setupPhysicsBodyWithVelocity:velocity];
    
    return enemy;
}

- (void) setupPhysicsBodyWithVelocity:(CGVector)velocity {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.velocity = velocity;
    self.physicsBody.categoryBitMask = CollisionCategoryEnemy;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = CollisionCategoryNinja | CollisionCategoryProjectile;
}

@end
