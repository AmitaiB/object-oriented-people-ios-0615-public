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

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    if(self) {
        _name = name;
        _friends = [[NSMutableArray alloc] init];
        _height = 9;
    }
    return self;
}

-(instancetype)init {
    self = [self initWithName:@""];
    return self;
}

//      arc4random is 0 to it's MAX. divided by it's MAX gives you a percentage. Multiply that by the range, and then add that to the original quantity...
-(CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX) * (maxRange - minRange); //+ minRange;
}

-(NSNumber *)grow {
//    CGFloat _height = 0;
    
    if (self.isFemale) {
        if (self.age < 11) {
            self.height += [self randomFloatBetweenNumber:0 andNumber:1];
        } else if (self.age <= 15) {
            self.height += [self randomFloatBetweenNumber:0.5 andNumber:2];
        } else if (self.age >= 15){}
    }
    
    if (!self.isFemale)  {
        if (self.age < 12) {
            self.height += [self randomFloatBetweenNumber:0 andNumber:1];
        }
        if (self.age <= 16) {
            self.height += [self randomFloatBetweenNumber:0.5 andNumber:3.5];
        }
        if (self.age > 16) {}
    }
    return [NSNumber numberWithFloat:self.height];
}

-(void)addFriends:(NSArray *)friends {
    [self.friends addObjectsFromArray:friends];
}

-(NSString *)generatePartyList {
    NSMutableString *partyList = [[NSMutableString alloc] init];
    for (NSInteger i = 0; i < [self.friends count]; i++) {
                                      [partyList appendString:(NSString *)self.friends[i]];
                                      [partyList appendString:@", "];
                                  }
    NSLog(@"%@", [partyList copy]);
//                                         enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        [partyList appendFormat:@"%@, ", obj];
//                                         };
    return [partyList copy];
}

-(BOOL)removeFriend:(Person *)aFriend {
    BOOL isFriendOnList = [self.friends containsObject:aFriend];
    if (isFriendOnList) {
        [self.friends removeObject:aFriend];
    }
    return isFriendOnList;
}

-(NSArray *)removeFriends:(NSArray *)friends {
    NSMutableArray *friendsToRemoveWhoExistInDB = [[NSMutableArray alloc] init];
    for (NSString *erstwhileFriend in self.friends) {
        if ([self.friends containsObject:erstwhileFriend]) {
            [friendsToRemoveWhoExistInDB addObject:erstwhileFriend];
            [self.friends removeObject:erstwhileFriend];
        }
    }
    return friendsToRemoveWhoExistInDB;
}



@end
