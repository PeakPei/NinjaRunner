//
//  EnemyFactory.m
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/7/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "EnemyFactory.h"
#import "Util.h"
#import "EnemyNode.h"
#import "DragonNode.h"
#import "MonsterBullNode.h"
#import "GameScene.h"

@implementation EnemyFactory

+ (EnemyNode *) createEnemyWithType:(EnemyType)type inScene:(GameScene *)scene {
    EnemyNode *enemy;
    float enemyX;
    float enemyY;
    EnemyType enemyType = (EnemyType)arc4random_uniform(2);
    
    if (enemyType == EnemyTypeDragon) {
        enemyY = scene.frame.size.height * FlyingEnemyYPercent;
        enemy = [DragonNode dragonWithPosition:CGPointZero velocity:CGVectorMake(DragonVelocityX, 0)
                                        health:DragonHealth pointsForKill:DragonPoints];
    } else if (enemyType == EnemyTypeMonsterBull) {
        enemy = [MonsterBullNode monsterBullWithPosition:CGPointZero velocity:CGVectorMake(MonsterBullVelocityX, 0)
                                                  health:MonsterBullHealth pointsForKill:MonsterBullPoints];
        enemyY = scene.groundHeight + enemy.frame.size.height / 2;
    }
    
    enemyX = scene.frame.size.width + enemy.frame.size.width / 2;
    enemy.position = CGPointMake(enemyX, enemyY);
    
    return enemy;
}

@end
