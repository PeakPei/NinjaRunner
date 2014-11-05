//
//  ProjectileNode.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/5/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ProjectileNode : SKSpriteNode

+ (instancetype) projectileAtPosition:(CGPoint)position;

@property (nonatomic) NSInteger damage;

@end
