//
//  NinjaNode.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/3/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static NSString *NinjaJumpActionKey = @"Jump";

@interface NinjaNode : SKSpriteNode

+ (instancetype) ninjaWithPosition:(CGPoint)position inScene:(SKScene *)scene;

@property NSInteger jumpsInProgressCount;

- (void) jump;
- (void) attack;

@end
