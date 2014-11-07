//
//  EnemyFactory.h
//  NinjaRunner
//
//  Created by Nikola Bozhkov on 11/7/14.
//  Copyright (c) 2014 TeamOnaga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Util.h"
#import "EnemyNode.h"

@interface EnemyFactory : NSObject

+ (EnemyNode *) createEnemyWithType:(EnemyType)type inScene:(SKScene *)scene;

@end
