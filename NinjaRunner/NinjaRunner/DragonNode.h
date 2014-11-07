//
//  DragonNode.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/3/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "EnemyNode.h"

@interface DragonNode : EnemyNode

+ (instancetype)dragonWithPosition:(CGPoint)position
                          velocity:(CGVector)velocity
                            health:(NSInteger)health
                     pointsForKill:(NSInteger)points;
@end
