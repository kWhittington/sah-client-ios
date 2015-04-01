//
//  PlayAction.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import Foundation;

@class Card;

@interface PlayAction : NSObject
@property(readonly, copy, nonatomic) void (^action)(Card *);
@property(readonly, weak, nonatomic) Card *card;

+ (instancetype)withCard:(Card *)card andAction:(void (^)(Card *))action;

- (BOOL)isEqualToPlayAction:(PlayAction *)playAction;
- (void)perform;
@end
