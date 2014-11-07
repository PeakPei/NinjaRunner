//
//  EagleNode.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/7/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "EagleNode.h"

@implementation EagleNode

+ (instancetype)eagleWithPosition:(CGPoint)position velocity:(CGVector)velocity health:(NSInteger)health pointsForKill:(NSInteger)points {
    EagleNode *eagle = [super enemyWithImageNamed:@"eagle_1" position:position velocity:velocity health:health pointsForKill:points];
    eagle.xScale = 1.2;
    eagle.yScale = 1.2;
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"eagle_1"],
                          [SKTexture textureWithImageNamed:@"eagle_2"],
                          [SKTexture textureWithImageNamed:@"eagle_3"],
                          [SKTexture textureWithImageNamed:@"eagle_4"]];
    
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.12];
    [eagle runAction:[SKAction repeatActionForever:animation]];
    
    return eagle;
}

- (void) setupPhysicsBodyWithVelocity:(CGVector)velocity {
    CGSize bodySize = CGSizeMake(self.frame.size.width * 0.15, self.frame.size.height);
    CGPoint bodyCenter = CGPointMake(self.position.x - self.frame.size.width / 2, self.position.y);
    
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:bodySize center:bodyCenter];
    [super setupPhysicsBodyPropertiesWithVelocity:velocity];
}

@end
