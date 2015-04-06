//
//  Card.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import Foundation;

@class PlayAction;

@interface Card : NSObject <NSCopying>
@property(readonly, nonatomic) PlayAction *playAction;
@property(readonly, nonatomic) NSString *string;

+ (UIColor *)CardColor;
+ (UIColor *)StringColor;

+ (instancetype)blank;
+ (instancetype)withString:(NSString *)string;
+ (instancetype)withString:(NSString *)string andAction:(void (^)(Card *))action;
+ (instancetype)withString:(NSString *)string andPlayAction:(PlayAction *)playAction;

- (instancetype)copyWithZone:(NSZone *)zone;
- (instancetype)initWithString:(NSString *)string;
- (instancetype)initWithString:(NSString *)string andAction:(void (^)(Card *))action;
- (instancetype)initWithString:(NSString *)string andPlayAction:(PlayAction *)playAction;
- (BOOL)isEqualToCard:(Card *)card;
- (void)play;
@end
