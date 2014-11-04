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
    [ninja run];
    
    return ninja;
}

-(void)run{
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
    
//    self.size = CGSizeMake(150, 130);
//    self.position = CGPointMake(100, 110);
    SKAction *runningNinjaAnimation = [SKAction animateWithTextures:textures timePerFrame:0.10];
    [self runAction:[SKAction repeatActionForever:runningNinjaAnimation] withKey:@"run"];
    

}

-(void)jump{
    NSArray *jumpTextures = @[
                              [SKTexture textureWithImageNamed:@"ninja_jump_3"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_4"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_5"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_6"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_7"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_8"]
                              ];
    //[self removeActionForKey:@"run"];
    
//    self.size = CGSizeMake(170, 180);
    
    SKTexture *jumpTexture = [SKTexture textureWithImageNamed:@"ninja_jump_1"];
    [self setTexture:jumpTexture];
    [self performSelector:@selector(attachSecondJumpLayer) withObject:nil afterDelay:0.13 ];
    //[NSTimer scheduledTimerWithTimeInterval:0.5 invocation:jump repeats:NO];
    
    
    self.position = CGPointMake(150, 240);
    
    
    SKAction *jumpingNinjaAnimation = [SKAction animateWithTextures:jumpTextures timePerFrame:0.13];
    [self runAction:[SKAction repeatAction:jumpingNinjaAnimation count:1]];

    
    //[self run];
    //[self removeActionForKey:@"jump"];
    //[self setSize:CGSizeMake(150, 130)];
}

-(void) attachSecondJumpLayer{
    SKTexture *jumpTexture = [SKTexture textureWithImageNamed:@"ninja_jump_2"];
    [self setTexture:jumpTexture];
}

-(void) jumpLower{
    NSArray *jumpTextures = @[
                              [SKTexture textureWithImageNamed:@"ninja_jump_low_1"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_low_2"],
                              [SKTexture textureWithImageNamed:@"ninja_jump_low_3"]
                              ];
    SKTexture *jumpTexture = [SKTexture textureWithImageNamed:@"ninja_jump_low_1"];
    [self setTexture:jumpTexture];
    
    self.position = CGPointMake(150, 160);
    SKAction *jumpingLowNinjaAnimation = [SKAction animateWithTextures:jumpTextures timePerFrame:0.07];
    [self runAction:[SKAction repeatAction:jumpingLowNinjaAnimation count:1]];

}

-(void)setNinjasNormalSize{
    self.size = CGSizeMake(150, 130);
    self.position = CGPointMake(100, 110);
}

//-(void)jumpWithFactor:(float)factor{
//    self.physicsBody.velocity = CGVectorMake(0.0, 500*factor);
//}

@end
