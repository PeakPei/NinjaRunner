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

//categories for the collisions
static const uint32_t ninjaCategory =  0x1 << 0;
static const uint32_t obstacleCategory =  0x1 << 1;

static const float BG_VELOCITY = 50.0;

static inline CGPoint CGPointAdd(const CGPoint a, const CGPoint b)
{
    return CGPointMake(a.x + b.x, a.y + b.y);
}

static inline CGPoint CGPointMultiplyScalar(const CGPoint a, const CGFloat b)
{
    return CGPointMake(a.x * b, a.y * b);
}

@implementation GameScene

@synthesize atlas, ninja;

NSTimeInterval _lastUpdateTime;
NSTimeInterval _dt;
NSTimeInterval _lastMissileAdded;
BOOL _jumped = NO;
int _counter = 0;


-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */

    self.physicsWorld.gravity = CGVectorMake(100, 110);
    self.physicsWorld.contactDelegate = self;
    
    self.backgroundColor = [SKColor whiteColor];
    [self initalizingScrollingBackground];
    
    
    self.ninja = [NinjaNode ninjaWithPosition:CGPointMake(100, 110)];
    //self.ninja.size = CGSizeMake(160, 140);
//    self.ninja.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.ninja.size];
//    self.ninja.physicsBody.categoryBitMask = ninjaCategory;
//    self.ninja.physicsBody.dynamic = YES;
//    self.ninja.physicsBody.contactTestBitMask = obstacleCategory;
//    self.ninja.physicsBody.collisionBitMask = 0;
//    self.ninja.physicsBody.usesPreciseCollisionDetection = YES;
    [self addChild:self.ninja];
    factor = 1.0;
    //[self performJumpingAnimation];
    
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

//-(void)jump{
//    if(self.ninja.isJumping == NO){
//        factor = factor - 0.07;
//        
//        //[self.ninja removeActionForKey:@"run"];
//        [self.ninja jumpWithFactor:factor];
//        self.ninja.size = CGSizeMake(150, 170);
//        self.ninja.position = CGPointMake(100, 125);
//        [self.ninja jump];
//        //[self.ninja run];
//    }
//}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(self.ninja.isJumping == NO){
        self.ninja.isJumping = YES;
        factor = 1.0;
        [self.ninja jump];
        jumpTimer = [NSTimer scheduledTimerWithTimeInterval:0.8 target:self.ninja selector:@selector(jump) userInfo:nil repeats:NO];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [jumpTimer invalidate];
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
        //TODO for today : [self addMissile];
    }
    
    
    
    [self moveBg];
    
    if(self.ninja.position.y >= 130 && self.ninja.isJumping == YES){
        if(_counter == 8){
            [self.ninja setNinjasNormalSize];
            _counter = 0;
            self.ninja.isJumping = NO;
        } else{
            _counter++;
        }
        self.ninja.isJumping = YES;
    } else{
        self.ninja.isJumping = NO;
        [self.ninja setNinjasNormalSize];
        
    }
}

@end
