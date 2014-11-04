//
//  VectorHelper.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/4/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface VectorHelper : NSObject

+ (CGPoint) addPoint:(CGPoint)first toPoint:(CGPoint)second;
+ (CGPoint) subtractPoint:(CGPoint)first fromPoint:(CGPoint)second;
+ (CGPoint) multiplyPoint:(CGPoint)point byScalar:(double)scalar;

@end
