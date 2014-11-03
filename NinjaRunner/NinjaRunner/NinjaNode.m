//
//  NinjaNode.m
//  NinjaRunner
//
//  Created by Gabriela Angelova on 11/3/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "NinjaNode.h"

@implementation NinjaNode

+(instancetype) ninjaWithPosition:(CGPoint)position{
    NinjaNode *ninja = [self spriteNodeWithImageNamed:@"ninja_run_1"];
    ninja.position = position;
    
    NSArray *textures = @[
                          [SKTexture textureWithImageNamed:@"ninja_run_1"],
                          [SKTexture textureWithImageNamed:@"ninja_run_2"],
                          [SKTexture textureWithImageNamed:@"ninja_run_3"],
                          [SKTexture textureWithImageNamed:@"ninja_run_4"],
                          [SKTexture textureWithImageNamed:@"ninja_run_5"],
                          [SKTexture textureWithImageNamed:@"ninja_run_6"],
                          [SKTexture textureWithImageNamed:@"ninja_run_7"],
                          [SKTexture textureWithImageNamed:@"ninja_run_8"]
                          ];
    SKAction *runningNinjaAnimation = [SKAction animateWithTextures:textures timePerFrame:0.13];
    [ninja runAction:[SKAction repeatActionForever:runningNinjaAnimation]];
    return ninja;
}

@end
