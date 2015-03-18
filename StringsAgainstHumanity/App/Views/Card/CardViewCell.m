//
//  CardCell.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardViewCell.h"
#import "Card.h"

@interface CardViewCell ()

@property(strong) Card *card;
@property(weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation CardViewCell

+ (NSString *)reusableID {
  return @"CardViewCell";
}

+ (NSNumber *)width {
  return @340;
}

+ (NSNumber *)height {
  return @475;
}

+ (CGSize)size {
  return CGSizeMake([CardViewCell width].floatValue, [CardViewCell height].floatValue);
}

- (void)configureForCard:(Card *)card {
  self.card = card;

  //  [self hideButton];
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

- (void)hideButton {
  NSLog(@"Button Hidden");
  self.button.hidden = NO;
}

- (void)showButton {
  self.button.hidden = NO;
}

- (void)showSelectedState {
  NSLog(@"Selecte State Shown");
  //  [self showButton];
  [self hideButton];
}

- (void)showDeselectedState {
  [self hideButton];
}

- (IBAction)buttonPressed:(UIButton *)sender {
}

@end
