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
#import "Util.h"
#import "BackgroundNode.h"
#import "GroundNode.h"
#import "ButtonNode.h"
#import "ProjectileNode.h"

@interface GameScene ()<SKPhysicsContactDelegate, UIGestureRecognizerDelegate>

@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property (nonatomic) NSTimeInterval timeSinceLastUpdate;

@property (nonatomic) NSTimeInterval longPressDuration;
@property (nonatomic) BOOL isLongPressActive;

@property (nonatomic) CGFloat groundHeight;

@end

@implementation GameScene {
    UISwipeGestureRecognizer *swipeUpRecognizer;
    UISwipeGestureRecognizer *swipeRightRecognizer;
    UILongPressGestureRecognizer *longPressRecognizer;
    
    BackgroundNode *background;
    NinjaNode *ninja;
}

NSTimeInterval _lastMissileAdded;


- (void) didMoveToView:(SKView *)view {
    /* Setup your scene here */
    [self setupGestureRecognizers];
    
    CGFloat sceneGravity = -self.frame.size.height * GravityMultiplier; // ~8
    self.physicsWorld.gravity = CGVectorMake(0, sceneGravity);
    self.physicsWorld.contactDelegate = self;
    
    background = [BackgroundNode backgroundAtPosition:CGPointZero parent:self];
    [self addChild:background];
    
    SKSpriteNode *backgroundImage = (SKSpriteNode *)[background childNodeWithName:BackgroundSpriteName];
    _groundHeight = backgroundImage.size.height * BackgroundLandHeightPercent;
    
    GroundNode *ground = [GroundNode groundWithSize:CGSizeMake(self.frame.size.width, _groundHeight)];
    [self addChild:ground];
    
    CGFloat ninjaPositionX = self.frame.size.width * NinjaPositionXPercent;
    ninja = [NinjaNode ninjaWithPosition:CGPointMake(ninjaPositionX, _groundHeight) inScene:self];
    [self addChild:ninja];
    
    DragonNode *dragon = [DragonNode dragonWithPosition:CGPointMake(550, 300)];
    [self addChild:dragon];
}

- (void) setupGestureRecognizers {
    swipeUpRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUpRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUpRecognizer];
    
    swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRightRecognizer];
    
    longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longPressRecognizer.minimumPressDuration = 0.25;
    [self.view addGestureRecognizer:longPressRecognizer];
}

- (void) addEnemy {
    DragonNode *dragon = [DragonNode dragonWithPosition:CGPointMake(650, 300)];
    
    dragon.name = @"dragon";
    
    
    [self addChild:dragon];
}

- (void) handleSwipe:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        [ninja jump];
    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        [ninja attack];
    }
}

- (void) handleLongPress:(UILongPressGestureRecognizer *)recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        // Animate progress
        NSLog(@"start");
        _isLongPressActive = YES;
    }
    
    if (recognizer.state == UIGestureRecognizerStateCancelled) {
        NSLog(@"cancelled(charge)");
        [ninja chargeAttack];
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded
        || recognizer.state == UIGestureRecognizerStateCancelled
        || recognizer.state == UIGestureRecognizerStateFailed) {
        _isLongPressActive = NO;
        _longPressDuration = 0;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:ButtonJumpName]) {
        [ninja jump];
    }
    
    if ([node.name isEqualToString:ButtonAttackName]) {
        [ninja attack];
    }
}

- (void)didBeginContact:(SKPhysicsContact *)contact {
    SKPhysicsBody *firstBody, *secondBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    } else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }

    // Reset jumps count on ground touch
    if (firstBody.categoryBitMask == CollisionCategoryNinja
        && secondBody.categoryBitMask == CollisionCategoryGround) {
        ninja.jumpsInProgressCount = 0;
        [ninja removeActionForKey:NinjaJumpActionKey];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    if (_lastUpdateTimeInterval) {
        _timeSinceLastUpdate = currentTime - _lastUpdateTimeInterval;
    }
    
    if( currentTime - _lastMissileAdded > 1)
    {
        _lastMissileAdded = currentTime + 1;
    }
    
    if (_isLongPressActive) {
        _longPressDuration += _timeSinceLastUpdate;
        NSLog(@"%f", _longPressDuration);
        
        if (_longPressDuration >= ChargeAttackDuration) {
            // Interrupt the long press(it is completed)
            longPressRecognizer.enabled = NO;
            longPressRecognizer.enabled = YES;
        }
    }
    
    [background moveByTimeSinceLastUpdate:_timeSinceLastUpdate];
    
    self.lastUpdateTimeInterval = currentTime;
}

//Method for the enemies move
//- (void)moveObstacle
//{
//    NSArray *nodes = self.children;
//    
//    for(SKNode * node in nodes){
//        if (![node.name  isEqual: @"background"] && ![node.name  isEqual: @"ninja"] && ![node.name isEqual:nil]) {
//            SKSpriteNode *ob = (SKSpriteNode *) node;
//            CGPoint obVelocity = CGPointMake(-OBJECT_VELOCITY, 0);
//            CGPoint amtToMove = CGPointMultiplyScalar(obVelocity,_dt);
//            
//            ob.position = CGPointAdd(ob.position, amtToMove);
//            if(ob.position.x < -100)
//            {
//                [ob removeFromParent];
//            }
//        }
//    }
//}

//-(void)moveDragon{
//    if(dragon.position.x <= ninja.position.x){
//        [dragon removeFromParent];
//        //[self performSelector:@selector(addEnemy) withObject:nil afterDelay:0.3 ];
//        [self addEnemy];
//    }
////    if(dragon.position.x == self.view.bounds.size.width/2 || dragon.position.x + 15 == self.view.bounds.size.width/2){
////        [self addEnemy];
////    }
//    if(dragon.position.x > ninja.position.x){
//        //dragon.position.x = -self.view.bounds.size.width/2;
//        CGPoint pos = dragon.position;
//        pos.x = dragon.position.x - 15;
//        dragon.position = pos;
//    }
//}

@end
