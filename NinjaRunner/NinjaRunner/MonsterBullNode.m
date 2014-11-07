//
//  MonsterBullNode.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/7/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "MonsterBullNode.h"
#import "Util.h"

@implementation MonsterBullNode

+ (instancetype)monsterBullWithPosition:(CGPoint)position velocity:(CGVector)velocity health:(NSInteger)health pointsForKill:(NSInteger)points {
    MonsterBullNode *monsterBull = [super enemyWithImageNamed:@"monster_bull_1" position:position velocity:velocity health:health pointsForKill:points];
    monsterBull.xScale = 1.9;
    monsterBull.yScale = 1.9;
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"monster_bull_1"],
                          [SKTexture textureWithImageNamed:@"monster_bull_2"],
                          [SKTexture textureWithImageNamed:@"monster_bull_3"]];
    
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.08];
    [monsterBull runAction:[SKAction repeatActionForever:animation]];
    
    return monsterBull;
}

- (void) setupPhysicsBodyWithVelocity:(CGVector)velocity {
    CGSize bodySize = CGSizeMake(self.frame.size.width * 0.15, self.frame.size.height);
    CGPoint bodyCenter = CGPointMake(self.position.x - self.frame.size.width / 4, self.position.y);
    
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:bodySize center:bodyCenter];
    [super setupPhysicsBodyPropertiesWithVelocity:velocity];
}

@end
