//
//  GameScene.h
//  NinjaRunner
//

//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "NinjaNode.h"

@interface GameScene : SKScene <SKPhysicsContactDelegate>{

    NSTimer *jumpTimer;
    float factor;

}

@property(strong, nonatomic)SKTextureAtlas *atlas;
@property(strong, nonatomic)NinjaNode *ninja;

@end
