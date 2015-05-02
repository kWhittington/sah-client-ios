//
//  CardViewController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/1/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "Card.h"
#import "CardView.h"
#import "CardViewController.h"

@interface CardViewController ()
@property(nonatomic) Card *card;
@end

@implementation CardViewController
+ (instancetype)withCard:(Card *)card {
  return [[self alloc] initWithCard:card];
}

#pragma mark Designated Initializer
- (instancetype)initWithCard:(Card *)card {
  self = [super init];

  [self initPropertiesWithCard:card];

  return self;
}

- (CardView *)cardView {
  if ([self.view isKindOfClass:CardView.class]) {
    return (CardView *)self.view;
  }

  return nil;
}

- (void)initPropertiesWithCard:(Card *)card {
  self.card = card;
}

- (BOOL)isEqual:(id)other {
  if ([self isIdenticalTo:other]) {
    return YES;
  }

  unless([other isKindOfClass:self.class]) { return NO; }

  return [self isEqualToCardViewController:(CardViewController *)other];
}

- (BOOL)isEqualToCardViewController:(CardViewController *)other {
  BOOL cardsAreEqual = [self.card isEqualToCard:other.card];

  return cardsAreEqual;
}

- (void)loadView {
  self.view = [CardView withMainScreenFrameAndCard:self.card];
}
@end
