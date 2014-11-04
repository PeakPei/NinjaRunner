//
//  VectorHelper.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/4/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "VectorHelper.h"

@implementation VectorHelper

+ (CGPoint)addPoint:(CGPoint)first toPoint:(CGPoint)second {
    return CGPointMake(first.x + second.x, first.y + second.y);
}

+ (CGPoint)subtractPoint:(CGPoint)first fromPoint:(CGPoint)second {
    return CGPointMake(second.x - first.x, second.y - first.y);
}

+ (CGPoint)multiplyPoint:(CGPoint)point byScalar:(double)scalar {
    return CGPointMake(point.x * scalar, point.y * scalar);
}

@end
