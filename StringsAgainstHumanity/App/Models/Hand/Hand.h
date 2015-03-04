//
//  Hand.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"

@class Card;

@interface Hand : NSObject

+ (NSNumber *)SizeLimit;
+ (Hand *)testHand;
+ (Hand *)empty;
+ (Hand *)withArray:(NSArray *)cards;

- (void)addCard:(Card *)card;
- (Card *)cardAtIndex:(NSUInteger)index;
- (NSArray *)cards;
- (NSArray *)cardsAtIndexes:(NSIndexSet *)indexes;
- (NSUInteger)indexOfCard:(Card *)card;
- (BOOL)isEmpty;
- (BOOL)isFull;
- (void)removeAllCards;
- (void)removeCard:(Card *)card;
- (void)removeCardAtIndex:(NSUInteger)index;
- (void)removeCardsAtIndexes:(NSIndexSet *)indexes;
- (void)removeCardsInArray:(NSArray *)cards;
- (NSUInteger)size;

@end
