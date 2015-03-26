//
//  Play.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import Foundation;

@class Card;

@interface Play : NSObject
@property(readonly, copy, nonatomic) Card *card;
@property(readonly, nonatomic) void (^action)(Card *);

+ (instancetype)withCard:(Card *)card andAction:(void (^)(Card *))action;
@end
