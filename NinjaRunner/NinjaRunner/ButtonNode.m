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

// Buttons are now gestures
//- (void) setupButtons {
//    float margin = self.frame.size.width * MarginPercent;
//    
//    CGSize sizeButton = CGSizeMake(self.frame.size.width * ButtonSizePercent,
//                                   self.frame.size.width * ButtonSizePercent);
//    
//    CGPoint positionButtonJump = CGPointMake(margin, margin);
//    ButtonNode *buttonJump = [ButtonNode buttonWithPosition:positionButtonJump
//                                                       size:sizeButton
//                                                      color:[SKColor darkGrayColor]
//                                                      alpha:0.3];
//    buttonJump.name = ButtonJumpName;
//    [self addChild:buttonJump];
//    
//    CGPoint positionButtonAttack = CGPointMake(self.size.width - margin - sizeButton.width, margin);
//    ButtonNode *buttonAttack = [ButtonNode buttonWithPosition:positionButtonAttack
//                                                         size:sizeButton
//                                                        color:[SKColor redColor]
//                                                        alpha:0.2];
//    
//    buttonAttack.name = ButtonAttackName;
//    [self addChild:buttonAttack];
//    
//    CGPoint positionButtonSpecialAttack = CGPointMake(positionButtonAttack.x - sizeButton.width - margin * 2, margin);
//    ButtonNode *buttonSpecialAttack = [ButtonNode buttonWithPosition:positionButtonSpecialAttack
//                                                                size:sizeButton
//                                                               color:[SKColor yellowColor]
//                                                               alpha:0.2];
//    
//    buttonSpecialAttack.name = ButtonSpecialAttackName;
//    [self addChild:buttonSpecialAttack];
//}

@end
