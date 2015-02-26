//
//  Card.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(readonly, strong) NSString *string;

+ (instancetype)blank;
+ (instancetype)withString:(NSString *)string;

- (instancetype)initWithString:(NSString *)string;

@end
