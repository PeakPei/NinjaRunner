//
//  BackgroundNode.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/4/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BackgroundNode : SKNode

+ (instancetype) backgroundAtPosition:(CGPoint)position parent:(SKScene *)parent;

- (void) moveByTimeSinceLastUpdate:(NSTimeInterval)timeSinceLastUpdate;

@end
