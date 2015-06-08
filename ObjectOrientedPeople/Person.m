//
//  Person.m
//  ObjectOrientedPeople
//
//  Created by Amitai Blickstein on 6/8/15.
//  Copyright (c) 2015 al-tyus.com. All rights reserved.
//

#import "Person.h"


@implementation Person

-(NSNumber *)grow {
    NSUInteger ageInt = [self.age intValue];
    CGFloat growth = 0;
    
    if (self.isFemale) {
        if (ageInt < 11) {
            growth = [self randomFloatBetweenNumber:0 andNumber:1];
        } else if (ageInt <= 15) {
            growth = [self randomFloatBetweenNumber:0.5 andNumber:2];
        } else if (ageInt >= 15){}
    }
    
    if (!self.isFemale)  {
        if (ageInt < 12) {
            growth = [self randomFloatBetweenNumber:0 andNumber:1];
        }
        if (ageInt <= 16) {
            growth = [self randomFloatBetweenNumber:0.5 andNumber:3.5];
        }
        if (ageInt > 16) {}
    }
    
    NSNumber *growthToNumber = [NSNumber numberWithFloat:growth];
    return growthToNumber;
}
    
-(CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
    {
        return ((float)arc4random() / ARC4RANDOM_MAX) * (maxRange - minRange) + minRange;
    }

-(void)addFriends:(NSArray *)friends {
    [self.friends addObjectsFromArray:friends];
    }

-(NSString *)generatePartyList {
    [self.friends componentsJoinedByString:[@", "]];
    }

-(BOOL)removeFriend:(Person *)friend;

-(NSArray *)removeFriends:(NSArray *)friends;

@end