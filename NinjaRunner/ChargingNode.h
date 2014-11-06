//
//  ChargingNode.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/6/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ChargingNode : SKNode

+ (instancetype) chargingNodeWithPosition:(CGPoint)position text:(NSString *)text;

- (void) finishChargingWithText:(NSString *)text;

@end
