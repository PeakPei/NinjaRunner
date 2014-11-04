//
//  GameScene.h
//  NinjaRunner
//

//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "NinjaNode.h"

@interface GameScene : SKScene <SKPhysicsContactDelegate, NSObject>{

    NSTimer *jumpTimer;
    float factor;

}

@end
