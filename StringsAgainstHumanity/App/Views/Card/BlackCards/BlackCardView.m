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

- (void)initBackgroundColor;
- (void)initLabel;
@end

@implementation BlackCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)initBackgroundColor {
  self.backgroundColor = Constants.BlackColor;
}

- (void)initLabel {
  self.textLabel = [[UILabel alloc] init];
  self.textLabel.text = self.blackCard.string;
  self.textLabel.textColor = Constants.WhiteColor;
}

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

- (void)updateConstraints {
}

@end
