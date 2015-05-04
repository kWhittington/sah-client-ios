//
//  BlackCardTextView.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/3/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "BlackCardView.h"
#import "BlackCardTextView.h"

@implementation BlackCardTextView
+ (instancetype)withFrame:(CGRect)frame andBlackCardView:(BlackCardView *)blackCardView {
  return [[self alloc] initWithFrame:frame andBlackCardView:blackCardView];
}

+ (instancetype)withMainScreenFrameAndBlackCardView:(BlackCardView *)blackCardView {
  return [[self alloc] initWithMainScreenFrameAndBlackCardView:blackCardView];
}

- (instancetype)initWithFrame:(CGRect)frame andCardView:(CardView *)cardView {
  return [self initWithFrame:frame andBlackCardView:(BlackCardView *)cardView];
}

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andBlackCardView:(BlackCardView *)blackCardView {
  self = [super initWithFrame:frame andCardView:blackCardView];

  [self initProperties];

  return self;
}

- (instancetype)initWithMainScreenFrameAndBlackCardView:(BlackCardView *)blackCardView {
  return [self initWithMainScreenFrameAndCardView:blackCardView];
}

- (void)initProperties {
  self.textColor = Constants.WhiteColor;
}

- (BlackCardView *)blackCardView {
  if ([self.cardView isKindOfClass:BlackCardView.class]) {
    return (BlackCardView *)self.cardView;
  }

  return nil;
}
@end
