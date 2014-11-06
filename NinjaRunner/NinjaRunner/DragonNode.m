//
//  DragonNode.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/3/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "DragonNode.h"

@implementation DragonNode

+ (instancetype)dragonWithPosition:(CGPoint)position velocity:(CGVector)velocity health:(NSInteger)health {
    DragonNode *dragon = [super enemyWithImageNamed:@"dragon_1" position:position velocity:velocity health:health];
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"dragon_1"],
                          [SKTexture textureWithImageNamed:@"dragon_2"],
                          [SKTexture textureWithImageNamed:@"dragon_3"],
                          [SKTexture textureWithImageNamed:@"dragon_4"],
                          [SKTexture textureWithImageNamed:@"dragon_5"],
                          [SKTexture textureWithImageNamed:@"dragon_6"],
                          [SKTexture textureWithImageNamed:@"dragon_7"],
                          [SKTexture textureWithImageNamed:@"dragon_8"]];
    
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.13];
    [dragon runAction:[SKAction repeatActionForever:animation]];

    return dragon;
}

@end
