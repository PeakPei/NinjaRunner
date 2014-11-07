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
#import "EagleNode.h"
#import "EarthDragonNode.h"
#import "GameScene.h"

static EnemyType previousEnemy;

@implementation EnemyFactory

+ (EnemyNode *) createEnemyWithType:(EnemyType)type inScene:(GameScene *)scene {
    EnemyNode *enemy;
    float enemyX;
    float enemyY;
    EnemyType enemyType = (EnemyType)arc4random_uniform(NumberOfTypes);
    
    while (enemyType == previousEnemy || enemyType == EnemyTypeDragon) {
        enemyType = (EnemyType)arc4random_uniform(NumberOfTypes);
    }
    
    previousEnemy = enemyType;
    
    if (enemyType == EnemyTypeMonsterBull) {
        enemy = [MonsterBullNode monsterBullWithPosition:CGPointZero velocity:CGVectorMake(MonsterBullVelocityX, 0)
                                                  health:MonsterBullHealth pointsForKill:MonsterBullPoints];
        enemyY = scene.groundHeight + enemy.frame.size.height / 2;
    } else if (enemyType == EnemyTypeEagle) {
        enemyY = scene.frame.size.height * EagleYPercent;
        enemy = [EagleNode eagleWithPosition:CGPointZero velocity:CGVectorMake(EagleVelocityX, 0)
                                      health:EagleHealth pointsForKill:EaglePoints];
    } else if (enemyType == EnemyTypeEarthDragon) {
        enemy = [EarthDragonNode earthDragonWithPosition:CGPointZero velocity:CGVectorMake(EarthDragonVelocityX, 0)
                                                  health:EarthDragonHealth pointsForKill:EarthDragonPoints];
        enemyY = scene.groundHeight + enemy.frame.size.height / 2;
    }
    
    enemyX = scene.frame.size.width + enemy.frame.size.width / 2;
    enemy.position = CGPointMake(enemyX, enemyY);
    
    return enemy;
}

+ (void) createDragonByChance:(NSInteger)chance inScene:(GameScene *)scene {
    NSInteger random = arc4random_uniform(100);
    
    if (random < chance) {
        DragonNode *dragon = [DragonNode dragonWithPosition:CGPointZero velocity:CGVectorMake(DragonVelocityX, 0)
                                                     health:DragonHealth pointsForKill:DragonPoints];
        
        float dragonY = scene.frame.size.height * DragonYPercent;
        float dragonX = scene.frame.size.width + dragon.frame.size.width / 2;
        dragon.position = CGPointMake(dragonX, dragonY);
        
        [scene addChild:dragon];
    }
}

@end
