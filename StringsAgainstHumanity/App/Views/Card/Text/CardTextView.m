//
//  CardTextView.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/20/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardTextView.h"
#import "CardView.h"
#import "Card.h"

@implementation CardTextView
+ (instancetype)withFrame:(CGRect)frame andCardView:(CardView *)cardView {
  return [[self alloc] initWithFrame:frame andCardView:cardView];
}

+ (instancetype)withMainScreenFrameAndCardView:(CardView *)cardView {
  return [[self alloc] initWithMainScreenFrameAndCardView:cardView];
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer {
  return [self initWithFrame:frame andCardView:[CardView withFrame:frame]];
}

- (instancetype)initWithFrame:(CGRect)frame andCardView:(CardView *)cardView {
  self = [super initWithFrame:frame textContainer:nil];

  if (self) {
    [self initProperties];
    [cardView addSubview:self];
  }

  return self;
}

- (instancetype)initWithMainScreenFrameAndCardView:(CardView *)cardView {
  return [self initWithFrame:UIScreen.mainScreen.bounds andCardView:cardView];
}

- (void)initProperties {
  self.backgroundColor = [UIColor clearColor];
  self.editable = NO;
  self.font = [UIFont fontWithName:@"Helvetica-Bold" size:28];
  self.selectable = NO;
  self.textAlignment = NSTextAlignmentLeft;
}

- (CardView *)cardView {
  if ([self.superview isKindOfClass:[CardView class]]) {
    return (CardView *)self.superview;
  }

  return nil;
}

- (NSString *)text {
  if (self.cardView) {
    return self.cardView.card.string;
  }

  return @"";
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
  BOOL isNil = newSuperview == nil;
  BOOL isKindOfCardView = [newSuperview isKindOfClass:CardView.class];

  unless(isNil || isKindOfCardView) {
    [NSException
       raise:@"SuperviewTypeError"
      format:@"CardTextView.superview must be a kind of CardView, not %@", newSuperview.class];
  }
}
@end
