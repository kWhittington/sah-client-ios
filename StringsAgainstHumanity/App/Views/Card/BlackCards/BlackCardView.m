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
@property(nonatomic) UITextView *textView;
@end

@implementation BlackCardView
- (instancetype)initWithFrame:(CGRect)frame {
  return [self initWithFrame:frame andBlackCard:[BlackCard withString:@"Made by BlackCardView"]];
}

- (instancetype)initWithFrame:(CGRect)frame andBlackCard:(BlackCard *)blackCard {
  self = [super initWithFrame:frame];

  if (self) {
    self.blackCard = blackCard;
    [self initTextView];
    [self initBackgroundColor];
  }

  return self;
}

- (void)initBackgroundColor {
  self.backgroundColor = Constants.BlackColor;
}

- (void)initTextView {
  self.textView = [[UITextView alloc] init];
  self.textView.text = @"Hi! How are you? This is a really long string! Yes it is!";
  self.textView.textColor = Constants.WhiteColor;
  self.textView.font = [UIFont fontWithName:@"Helvetica-Bold" size:28];
  self.textView.backgroundColor = UIColor.clearColor;
  self.textView.editable = NO;
  self.textView.selectable = NO;

  [self addSubview:self.textView];

  [self.textView makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(44, 44, 44, 44));
  }];
}
@end
