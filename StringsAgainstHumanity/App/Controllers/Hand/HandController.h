//
//  HandController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"

@class Hand;
@class Card;

@interface HandController : UICollectionViewController
@property(readonly, copy, nonatomic) Hand *hand;
@property(readonly, nonatomic) NSArray *selectedCards;

+ (NSString *)StoryboardID;

+ (instancetype)empty;
+ (instancetype)withHand:(Hand *)hand;

- (void)addCard:(Card *)card;
- (void)removeCard:(Card *)card;
- (void)selectCard:(Card *)card;
@end
