//
//  Card.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import Foundation;

@interface Card : NSObject <NSCopying>

@property(readonly, strong) NSString *string;

+ (UIColor *)CardColor;
+ (UIColor *)StringColor;

+ (instancetype)blank;
+ (instancetype)withString:(NSString *)string;

- (instancetype)copyWithZone:(NSZone *)zone;
- (instancetype)initWithString:(NSString *)string;
- (BOOL)isEqualToCard:(Card *)card;
@end
