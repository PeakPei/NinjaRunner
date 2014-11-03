//
//  GameScene.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/3/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "GameScene.h"
#import "NinjaNode.h"
#import "DragonNode.h"

static const float BG_VELOCITY = 100.0;

static inline CGPoint CGPointAdd(const CGPoint a, const CGPoint b)
{
    return CGPointMake(a.x + b.x, a.y + b.y);
}

static inline CGPoint CGPointMultiplyScalar(const CGPoint a, const CGFloat b)
{
    return CGPointMake(a.x * b, a.y * b);
}

@implementation GameScene

NSTimeInterval _lastUpdateTime;
NSTimeInterval _dt;
NSTimeInterval _lastMissileAdded;

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"Sprites"];
//    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
//    background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
//    background.zPosition = -1;
//    //background
//    [self addChild:background];
    
    
    self.backgroundColor = [SKColor whiteColor];
    [self initalizingScrollingBackground];
    
    NinjaNode *ninja = [NinjaNode ninjaWithPosition:CGPointMake(100, 77)];
    [self addChild:ninja];
    
    DragonNode *dragon = [DragonNode dragonWithPosition:CGPointMake(400, 300)];
    [self addChild:dragon];
}

-(void)initalizingScrollingBackground
{
    for (int i = 0; i < 2; i++) {
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        bg.position = CGPointMake(i * bg.size.width, 0);
        bg.anchorPoint = CGPointZero;
        bg.name = @"background";
        [self addChild:bg];
    }
}

- (void)moveBg
{
    [self enumerateChildNodesWithName:@"background" usingBlock: ^(SKNode *node, BOOL *stop)
     {
         SKSpriteNode * bg = (SKSpriteNode *) node;
         CGPoint bgVelocity = CGPointMake(-BG_VELOCITY, 0);
         CGPoint amtToMove = CGPointMultiplyScalar(bgVelocity, _dt);
         bg.position = CGPointAdd(bg.position, amtToMove);
         bg.position = CGPointAdd(bg.position, amtToMove);
         
         //Checks if bg node is completely scrolled of the screen, if yes then put it at the end of the other node
         if (bg.position.x <= -bg.size.width)
         {
             bg.position = CGPointMake(bg.position.x + bg.size.width*2,
                                       bg.position.y);
         }
     }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    if (_lastUpdateTime)
    {
        _dt = currentTime - _lastUpdateTime;
    }
    else
    {
        _dt = 0;
    }
    _lastUpdateTime = currentTime;
    
    if( currentTime - _lastMissileAdded > 1)
    {
        _lastMissileAdded = currentTime + 1;
        //[self addMissile];
    }
    
    
    [self moveBg];
    //[self moveObstacle];
}

@end
