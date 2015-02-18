//
//  CardCell.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardCell.h"
#import "Card.h"

@interface CardCell ()

@property(strong) Card *card;

@end

@implementation CardCell

+ (NSNumber *)width {
  return @340;
}

+ (NSNumber *)height {
  return @475;
}

+ (CGSize)size {
  return CGSizeMake([CardCell width].floatValue, [CardCell height].floatValue);
}

- (void)configureForCard:(Card *)card {
  self.card = card;

  [self refreshVariables];
}

- (void)refreshVariables {
  [self refreshString];
  [self refreshBackgroundView];
  [self refreshSelectedBackgroundView];
}

- (void)refreshString {
  self.label.text = self.card.string;
}

- (void)refreshBackgroundView {
  UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
  backgroundView.backgroundColor = [UIColor whiteColor];
  self.backgroundView = backgroundView;
}

- (void)refreshSelectedBackgroundView {
  UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
  selectedBackgroundView.backgroundColor = [UIColor greenColor];
  self.selectedBackgroundView = selectedBackgroundView;
}

@end
