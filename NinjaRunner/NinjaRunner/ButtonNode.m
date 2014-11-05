//
//  ButtonNode.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/5/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ButtonNode.h"

@implementation ButtonNode

+ (instancetype)buttonWithPosition:(CGPoint)position size:(CGSize)size color:(SKColor *)color alpha:(float)alpha {
    ButtonNode *button = [[self alloc] init];
    CGRect circle = CGRectMake(position.x, position.y, size.width, size.height);
    button.path = [UIBezierPath bezierPathWithOvalInRect:circle].CGPath;
    button.fillColor = color;
    button.lineWidth = 3;
    button.alpha = alpha;
    button.zPosition = 1;
    
    return button;
}

@end
