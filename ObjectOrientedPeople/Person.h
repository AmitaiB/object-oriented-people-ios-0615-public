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


@end
