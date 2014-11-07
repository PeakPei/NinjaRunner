//
//  EarthDragonNode.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/7/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "EarthDragonNode.h"

@implementation EarthDragonNode

+ (instancetype)earthDragonWithPosition:(CGPoint)position velocity:(CGVector)velocity health:(NSInteger)health pointsForKill:(NSInteger)points {
    EarthDragonNode *earthDragon = [super enemyWithImageNamed:@"earth_dragon_1" position:position velocity:velocity health:health pointsForKill:points];
    earthDragon.xScale = 1;
    earthDragon.yScale = 1;
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"earth_dragon_1"],
                          [SKTexture textureWithImageNamed:@"earth_dragon_2"],
                          [SKTexture textureWithImageNamed:@"earth_dragon_3"],
                          [SKTexture textureWithImageNamed:@"earth_dragon_4"]];
    
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.12];
    [earthDragon runAction:[SKAction repeatActionForever:animation]];
    
    return earthDragon;
}

- (void) setupPhysicsBodyWithVelocity:(CGVector)velocity {
    CGSize bodySize = CGSizeMake(self.frame.size.width * 0.15, self.frame.size.height);
    CGPoint bodyCenter = CGPointMake(self.position.x - self.frame.size.width / 2, self.position.y);
    
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:bodySize center:bodyCenter];
    [super setupPhysicsBodyPropertiesWithVelocity:velocity];
}

@end
