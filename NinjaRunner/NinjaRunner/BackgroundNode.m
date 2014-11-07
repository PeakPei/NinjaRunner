//
//  BackgroundNode.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/4/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "BackgroundNode.h"
#import "Util.h"
#import "VectorHelper.h"

@implementation BackgroundNode

+ (instancetype)backgroundAtPosition:(CGPoint)position parent:(SKScene *)parent {
    BackgroundNode *background = [self node];
    background.position = position;
    background.name = BackgroundName;
    background.zPosition = -1;
    background.velocity = CGPointMake(BackgroundSpeed, 0);
    
    [background setImagesSetByScene:parent];
    
    
    
    return background;
}

- (void) setImagesSetByScene:(SKScene *)scene {
    for (int i = 0; i < 2; i++) {
        SKSpriteNode *backgroundSpriteNode = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        backgroundSpriteNode.size = CGSizeMake(scene.view.bounds.size.width, scene.view.bounds.size.height);
        backgroundSpriteNode.position = CGPointMake(i * backgroundSpriteNode.size.width, 0);
        backgroundSpriteNode.anchorPoint = CGPointZero;
        backgroundSpriteNode.name = BackgroundSpriteName;
        
        [self addChild:backgroundSpriteNode];
    }
}

- (void) moveByTimeSinceLastUpdate:(NSTimeInterval)timeSinceLastUpdate
{
    [self enumerateChildNodesWithName:BackgroundSpriteName usingBlock: ^(SKNode *node, BOOL *stop)
     {
         SKSpriteNode *backgroundSpriteNode = (SKSpriteNode *)node;
         
         CGPoint amountToMove = [VectorHelper multiplyPoint:_velocity byScalar:timeSinceLastUpdate];
         
         CGPoint newPosition = [VectorHelper addPoint:amountToMove toPoint:backgroundSpriteNode.position];
         backgroundSpriteNode.position = newPosition;
         
         //Checks if bg node is completely scrolled of the screen, if yes then put it at the end of the other node
         if (backgroundSpriteNode.position.x <= -backgroundSpriteNode.size.width)
         {
             backgroundSpriteNode.position = CGPointMake(backgroundSpriteNode.position.x + backgroundSpriteNode.size.width * 2,
                                                         backgroundSpriteNode.position.y);
         }
     }];
}

@end
