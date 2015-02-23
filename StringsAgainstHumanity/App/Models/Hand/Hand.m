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

- (Card *)cardAtIndex:(NSUInteger)index {
  return self.mutableCards[index];
}

- (void)addCard:(Card *)card {
  [self.mutableCards push:card];
}

- (void)removeCardAtIndex:(NSUInteger)index {
  [self.mutableCards removeObjectAtIndex:index];
}

- (void)removeCard:(Card *)card {
  [self.mutableCards removeObject:card];
}

- (void)removeCards:(NSArray *)cards {
  [self.mutableCards removeObjectsInArray:cards];
}

- (NSUInteger)size {
  return self.cards.count;
}

@end
