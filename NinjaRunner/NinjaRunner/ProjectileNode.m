//
//  ProjectileNode.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/5/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import "ProjectileNode.h"
#import "Util.h"

@implementation ProjectileNode

+ (instancetype)projectileAtPosition:(CGPoint)position {
    ProjectileNode *projectile = [self spriteNodeWithImageNamed:@"shuriken"];
    projectile.position = position;
    
    [projectile setupPhysicsBody];
    
    SKAction *rotation = [SKAction rotateByAngle:M_PI_4 duration:0.2];
    [projectile runAction:rotation];
    
    return projectile;
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.velocity = CGVectorMake(ProjectileVelocityX, 0);
}

@end
