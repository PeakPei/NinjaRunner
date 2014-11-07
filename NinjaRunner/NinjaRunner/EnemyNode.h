//
//  EnemyNode.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/6/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface EnemyNode : SKSpriteNode

+ (instancetype)enemyWithImageNamed:(NSString *)image
                           position:(CGPoint)position
                           velocity:(CGVector)velocity
                             health:(NSInteger)health
                      pointsForKill:(NSInteger)points;

@property (nonatomic, assign) NSInteger health;
@property (nonatomic, assign) NSInteger pointsForKill;

- (void) setupPhysicsBodyPropertiesWithVelocity:(CGVector)velocity;

@end
