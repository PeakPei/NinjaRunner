//
//  ButtonNode.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/5/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ButtonNode : SKShapeNode

+ (instancetype) buttonWithPosition:(CGPoint)position size:(CGSize)size color:(SKColor *)color alpha:(float)alpha;

@end
