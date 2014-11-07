//
//  HudNode.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/7/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "HudNode.h"
#import "Util.h"

@implementation HudNode

+ (instancetype)hudAtPosition:(CGPoint)position withFrame:(CGRect)frame {
    HudNode *hud = [self node];
    hud.position = position;
    hud.zPosition = 10;    
    hud.score = 0;

    SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    scoreLabel.name = ScoreLabelName;
    scoreLabel.text = @"0";
    scoreLabel.fontSize = 24;
    scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    float margin = frame.size.width * MarginPercent;
    scoreLabel.position = CGPointMake(0, - margin);
    [hud addChild:scoreLabel];
    
    return hud;
}

- (void) addPoints:(NSInteger) points {
    self.score += points;
    
    SKLabelNode *scoreLabel = (SKLabelNode *)[self childNodeWithName:ScoreLabelName];
    scoreLabel.text = [NSString stringWithFormat:@"%ld", self.score];
}


@end
