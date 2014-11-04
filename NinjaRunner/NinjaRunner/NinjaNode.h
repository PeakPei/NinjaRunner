//
//  NinjaNode.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/3/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface NinjaNode : SKSpriteNode

@property(nonatomic) BOOL isJumping;

+ (instancetype) ninjaWithPosition:(CGPoint)position;

- (void) run;

- (void) jump;

-(void) jumpLower;

-(void) setNinjasNormalSize;

//-(void)jumpWithFactor:(float)factor;

@end
