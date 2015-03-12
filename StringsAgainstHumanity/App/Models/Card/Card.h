//
//  Card.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject <NSCopying>

@property(readonly, strong) NSString *string;

+ (UIColor *)CardColor;
+ (UIColor *)TextColor;

+ (instancetype)blank;
+ (instancetype)withString:(NSString *)string;

- (instancetype)initWithString:(NSString *)string;

- (instancetype)copyWithZone:(NSZone *)zone;
- (BOOL)isEqualToCard:(Card *)card;
@end
