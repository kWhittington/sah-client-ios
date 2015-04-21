//
//  BlackCardView.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "BlackCardView.h"
#import "BlackCard.h"

@interface BlackCardView ()
@property(nonatomic) BlackCard *blackCard;
@property(nonatomic) UILabel *textLabel;
@end

@implementation BlackCardView
- (instancetype)initWithFrame:(CGRect)frame {
  return [self initWithFrame:frame andBlackCard:[BlackCard withString:@"Made by BlackCardView"]];
}

- (instancetype)initWithFrame:(CGRect)frame andBlackCard:(BlackCard *)blackCard {
  self = [super initWithFrame:frame];

  if (self) {
    self.blackCard = blackCard;
    [self initLabel];
    [self initBackgroundColor];
  }

  return self;
}

- (void)initBackgroundColor {
  self.backgroundColor = Constants.BlackColor;
}

- (void)initLabel {
  self.textLabel = [[UILabel alloc] initWithFrame:UIScreen.mainScreen.bounds];
  self.textLabel.text = self.blackCard.string;
  self.textLabel.textColor = Constants.WhiteColor;
  self.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
  [self addSubview:self.textLabel];

  [self makeLabelConstraints];
}

- (void)makeLabelConstraints {
  [self makeLabelLeftConstraints];
  [self makeLabelTopConstraints];
}

- (void)makeLabelLeftConstraints {
  [self.textLabel makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.left).with.offset(10);
  }];
}

- (void)makeLabelTopConstraints {
  [self.textLabel makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.top).with.offset(7);
  }];
}
@end
