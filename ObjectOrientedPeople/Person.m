//
//  Person.m
//  ObjectOrientedPeople
//
//  Created by Amitai Blickstein on 6/8/15.
//  Copyright (c) 2015 al-tyus.com. All rights reserved.
//

#import "Person.h"
#define ARC4RANDOM_MAX 0x100000000

@implementation Person

-(instancetype)initWithName:(NSString *)name
             isFemaleOrIsnt:(BOOL)femaleOrNot
                  andHeight:(CGFloat)height
                     andAge:(CGFloat)age {
    self = [super init];
    if(self){
        _name = name;
        _isFemale   = femaleOrNot;
        _friends    = [[NSMutableArray alloc] init];
        _height     = height;
        _age        = age;
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name {
    return [self initWithName:name isFemaleOrIsnt:nil andHeight:9 andAge:18];
}

-(instancetype)init {
    return [self initWithName:@""];
}

//      arc4random is 0 to it's MAX. divided by it's MAX gives you a percentage. Multiply that by the range, and then add that to the original quantity...
-(CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX) * (maxRange - minRange); //+ minRange;
}

-(NSNumber *)grow {

    if (self.isFemale) {
        if (self.age < 11) {
            self.height += [self randomFloatBetweenNumber:0 andNumber:1];
        } else if (self.age <= 15) {
            self.height += [self randomFloatBetweenNumber:0.5 andNumber:2];
        } else if (self.age >= 15){}
    }
    
    //If a boy...
    else {
        if (self.age < 12) {
            self.height += [self randomFloatBetweenNumber:0 andNumber:1];
        }
        else if (self.age <= 16) {
            self.height += [self randomFloatBetweenNumber:0.5 andNumber:3.5];
        }
        else if (self.age > 16) {}
    }
    NSLog(@"%@", [NSNumber numberWithFloat:self.height]);
    return [NSNumber numberWithFloat:self.height];
}

-(void)addFriends:(NSArray *)friends {
    [self.friends addObjectsFromArray:friends];
}

-(NSString *)generatePartyList {
    NSMutableArray *friendsToInviteList = [[NSMutableArray alloc] init];
    
    for (Person *friend in self.friends) {
        [friendsToInviteList addObject:friend.name];
    }
    NSString *partyList = [NSString stringWithString:[friendsToInviteList componentsJoinedByString:@", "]];
    return partyList;
}

-(BOOL)removeFriend:(Person *)erstwhileFriend {
    if (![self.friends containsObject:erstwhileFriend]) {
        return NO;
    }
        [self.friends removeObject:erstwhileFriend];
        return YES;
}

-(NSArray *)removeFriends:(NSArray *)frenemies {
    NSMutableArray *ShipList = [[NSMutableArray alloc] init];
    for (Person *frenemy in frenemies) {
        if ([self.friends containsObject:frenemy]) {
            [ShipList addObject:frenemy];
            [self.friends removeObject:frenemy];
        }
    }
    return ShipList;
}

@end
