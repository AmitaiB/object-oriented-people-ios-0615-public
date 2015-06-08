//
//  Person.h
//  ObjectOrientedPeople
//
//  Created by Amitai Blickstein on 6/8/15.
//  Copyright (c) 2015 al-tyus.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSNumber *height;
@property (strong, nonatomic) NSNumber *age;
@property (strong, nonatomic) NSString *name;
@property BOOL isFemale;
@property NSMutableArray *friends;

-(instancetype)init;
-(instancetype)initWithName:(NSString*)name;

-(NSNumber *)grow;

-(CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange;

-(void)addFriends:(NSArray *)friends;

-(NSString *)generatePartyList;

-(BOOL)removeFriend:(Person *)aFriend;

-(NSArray *)removeFriends:(NSArray *)friends;

@end
