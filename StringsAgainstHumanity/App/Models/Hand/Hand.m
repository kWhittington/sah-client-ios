//
//  Hand.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "Hand.h"
#import "Card.h"

@interface Hand ()

@property NSMutableArray *mutableCards;

- (instancetype)initWithArray:(NSArray *)array;
@end

@implementation Hand

+ (NSNumber *)SizeLimit {
  return [NSNumber numberWithInteger:10];
}

+ (Hand *)testHand {
  Hand *testHand = [[Hand alloc] init];

  [Hand.SizeLimit timesWithIndex:^(NSUInteger index) {
    NSNumber *number = [NSNumber numberWithUnsignedInteger:index];

    NSString *string = NSStringWithFormat(@"Card #%@ text.", number);

    Card *card = [[Card alloc] initWithString:string];

    [testHand addCard:card];
  }];

  return testHand;
}

+ (Hand *)empty {
  return [[Hand alloc] init];
}

+ (Hand *)withArray:(NSArray *)cards {
  Hand *hand = [[Hand alloc] init];

  [cards each:^(Card *card) {
    [hand addCard:card];
  }];

  return hand;
}
- (NSArray *)cards {
  return [self.mutableCards copy];
}

- (void)addCard:(Card *)card {
  [self.mutableCards push:card];
}

- (Card *)cardAtIndex:(NSUInteger)index {
  return self.mutableCards[index];
}

- (NSArray *)cardsAtIndexes:(NSIndexSet *)indexes {
  return [self.mutableCards objectsAtIndexes:indexes];
}

- (instancetype)copyWithZone:(NSZone *)zone {
  Hand *copy = [Hand withArray:self.cards.copy];

  return copy;
}

- (NSUInteger)indexOfCard:(Card *)card {
  NSUInteger result = [self.mutableCards indexOfObject:card];
  return result;
}

- (instancetype)init {
  return [self initWithArray:@[]];
}

#pragma mark Designated Initializer
- (instancetype)initWithArray:(NSArray *)array {
  self = [super init];

  self.mutableCards = [NSMutableArray arrayWithArray:array];

  return self;
}

- (BOOL)isEmpty {
  return self.size == 0;
}

- (BOOL)isEqual:(id)object {
  if (self == object) {
    return YES;
  }

  unless([object isKindOfClass:self.class]) { return NO; }

  return [self isEqualToHand:(Hand *)object];
}

- (BOOL)isEqualToHand:(Hand *)object {
  BOOL haveEqualCards = [self.cards isEqualToArray:object.cards];

  return haveEqualCards;
}

- (BOOL)isFull {
  return self.size == Hand.SizeLimit.unsignedIntegerValue;
}

- (void)removeAllCards {
  [self.mutableCards removeAllObjects];
}

- (void)removeCard:(Card *)card {
  [self.mutableCards removeObject:card];
}

- (void)removeCardAtIndex:(NSUInteger)index {
  [self.mutableCards removeObjectAtIndex:index];
}

- (void)removeCardsAtIndexes:(NSIndexSet *)indexes {
  [self.mutableCards removeObjectsAtIndexes:indexes];
}

- (void)removeCardsInArray:(NSArray *)cards {
  [self.mutableCards removeObjectsInArray:cards];
}

- (NSUInteger)size {
  return self.cards.count;
}

@end
