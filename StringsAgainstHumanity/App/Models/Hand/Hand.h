//
//  Hand.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import Foundation;

@class Card;

@interface Hand : NSObject <NSCopying>

+ (NSNumber *)SizeLimit;
+ (Hand *)testHand;
+ (Hand *)empty;
+ (Hand *)withArray:(NSArray *)cards;

- (void)addCard:(Card *)card;
- (Card *)cardAtIndex:(NSUInteger)index;
- (NSArray *)cards;
- (NSArray *)cardsAtIndexes:(NSIndexSet *)indexes;
- (instancetype)copyWithZone:(NSZone *)zone;
- (NSString *)debugDescription;
- (NSString *)description;
- (NSUInteger)indexOfCard:(Card *)card;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)object;
- (BOOL)isEqualToHand:(Hand *)object;
- (BOOL)isFull;
- (void)removeAllCards;
- (void)removeCard:(Card *)card;
- (void)removeCardAtIndex:(NSUInteger)index;
- (void)removeCardsAtIndexes:(NSIndexSet *)indexes;
- (void)removeCardsInArray:(NSArray *)cards;
- (NSUInteger)size;

@end
