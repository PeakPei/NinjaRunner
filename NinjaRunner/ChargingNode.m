//
//  ChargingNode.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/6/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "ChargingNode.h"
#import "Util.h"

@implementation ChargingNode

+ (instancetype)chargingNodeWithPosition:(CGPoint)position text:(NSString *)text {
    ChargingNode *chargingNode = [self node];
    chargingNode.name = ChargingNodeName;
    
    SKLabelNode *chargingLabel = [SKLabelNode labelNodeWithFontNamed:@"ChalkboardSE-Bold"];
    chargingLabel.position = position;
    chargingLabel.name = @"ChargingLabel";
    chargingLabel.text = text;
    chargingLabel.fontColor = [SKColor orangeColor];
    chargingLabel.alpha = 0.3;
    chargingLabel.fontSize = 25;
    
    SKAction *scaleUp = [SKAction scaleTo:1 duration:0.5];
    SKAction *scaleDown = [SKAction scaleTo:0.8 duration:0.5];
    SKAction *sequence = [SKAction sequence:@[scaleDown, scaleUp]];
    [chargingLabel runAction:[SKAction repeatActionForever:sequence]];
    
    [chargingNode addChild:chargingLabel];
    return chargingNode;
}

- (void) finishChargingWithText:(NSString *)text {
    SKLabelNode *chargingLabel = (SKLabelNode *)[self childNodeWithName:@"ChargingLabel"];
    [chargingLabel removeAllActions];
    
    SKAction *scaleUp = [SKAction scaleTo:1.1 duration:0.25];
    SKAction *removeBlock = [SKAction runBlock:^{
        [self removeFromParent];
    }];
    
    SKAction *sequence = [SKAction sequence:@[scaleUp,
                                              [SKAction waitForDuration:0.25],
                                              removeBlock]];
    chargingLabel.text = text;
    
    [chargingLabel runAction:sequence];
}

@end
