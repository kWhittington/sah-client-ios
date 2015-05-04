//
//  BlackCardViewController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"

#import "BlackCard.h"
#import "BlackCardView.h"
#import "BlackCardViewController.h"

@implementation BlackCardViewController
+ (instancetype)withBlackCard:(BlackCard *)blackCard {
  return [[self alloc] initWithBlackCard:blackCard];
}

- (instancetype)initWithCard:(Card *)card {
  unless([card isKindOfClass:BlackCard.class]) {
    [NSException
       raise:@"CardTypeException"
      format:@"BlackCardViewController.card must be assigned a BlackCard, not %@", card.class];
  }

  return [self initWithBlackCard:(BlackCard *)card];
}

#pragma mark Designated Initializer
- (instancetype)initWithBlackCard:(BlackCard *)blackCard {
  self = [super initWithCard:blackCard];

  return self;
}

- (BlackCard *)blackCard {
  return (BlackCard *)self.card;
}

- (BlackCardView *)blackCardView {
  return (BlackCardView *)self.cardView;
}

- (BOOL)isEqualToCardViewController:(CardViewController *)other {
  if ([other isKindOfClass:BlackCardViewController.class]) {
    return [self isEqualToBlackCardViewController:(BlackCardViewController *)other];
  }

  return NO;
}

- (BOOL)isEqualToBlackCardViewController:(BlackCardViewController *)other {
  BOOL blackCardsAreEqual = [self.blackCard isEqualToBlackCard:other.blackCard];

  return blackCardsAreEqual;
}

- (void)loadView {
  self.view = [BlackCardView withMainScreenFrameAndBlackCard:self.blackCard];
}
@end
