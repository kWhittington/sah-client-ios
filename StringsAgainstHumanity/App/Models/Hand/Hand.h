//
//  Hand.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "PrefixHeader.pch"

@class Card;

@interface Hand : NSObject

+ (NSNumber *)SizeLimit;
+ (Hand *)testHand;
+ (Hand *)empty;
+ (Hand *)withArray:(NSArray *)cards;

- (NSArray *)cards;
- (void)addCard:(Card *)card;
- (Card *)cardAtIndex:(NSUInteger)index;
- (BOOL)isEmpty;
- (BOOL)isFull;
- (void)removeCard:(Card *)card;
- (void)removeCardAtIndex:(NSUInteger)index;
- (void)removeCardsAtIndexes:(NSIndexSet *)indexes;
- (void)removeCardsInArray:(NSArray *)cards;
- (NSUInteger)size;

@end
