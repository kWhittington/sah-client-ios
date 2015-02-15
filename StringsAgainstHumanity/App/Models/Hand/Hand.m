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

@property NSArray *cards;

@end

@implementation Hand

+ (Hand *)testHand {
  Hand *testHand = [[Hand alloc] init];

  [@3 timesWithIndex:^(NSUInteger index) {
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
  self.cards = [[NSArray alloc] init];
}

- (void)addCard:(Card *)card {
  self.cards = [self.cards arrayByAddingObject:card];
}

@end
