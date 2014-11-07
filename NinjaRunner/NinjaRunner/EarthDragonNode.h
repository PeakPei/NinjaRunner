//
//  EarthDragonNode.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/7/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "EnemyNode.h"

@interface EarthDragonNode : EnemyNode

+ (instancetype)earthDragonWithPosition:(CGPoint)position
                         velocity:(CGVector)velocity
                           health:(NSInteger)health
                    pointsForKill:(NSInteger)points;

@end
