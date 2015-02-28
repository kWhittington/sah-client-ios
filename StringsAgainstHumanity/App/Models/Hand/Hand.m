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

@end

@implementation Hand

+ (NSNumber *)SizeLimit {
  return [NSNumber numberWithInteger:10];
}

+ (Hand *)testHand {
  Hand *testHand = [[Hand alloc] init];

  [@5 timesWithIndex:^(NSUInteger index) {
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

// Designated Initializer
- (instancetype)init {
  self = [super init];

  [self initCards];

  return self;
}

- (void)initCards {
  self.mutableCards = [[NSMutableArray alloc] init];
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

- (NSUInteger)indexOfCard:(Card *)card {
  NSUInteger result = [self.mutableCards indexOfObject:card];
  return result;
}

- (BOOL)isEmpty {
  return self.size == 0;
}

- (BOOL)isFull {
  return self.size == Hand.SizeLimit.unsignedIntegerValue;
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
