//
//  WhiteCardTextView.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "WhiteCardView.h"
#import "WhiteCardTextView.h"

@implementation WhiteCardTextView
+ (instancetype)withFrame:(CGRect)frame andWhiteCardView:(WhiteCardView *)whiteCardView {
  return [[self alloc] initWithFrame:frame andWhiteCardView:whiteCardView];
}

+ (instancetype)withMainScreenFrameAndWhiteCardView:(WhiteCardView *)whiteCardView {
  return [[self alloc] initWithMainScreenFrameAndCardView:whiteCardView];
}

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andWhiteCardView:(WhiteCardView *)whiteCardView {
  self = [super initWithFrame:frame andCardView:whiteCardView];

  [self initProperties];

  return self;
}

- (instancetype)initWithMainScreenFrameAndWhiteCardView:(WhiteCardView *)whiteCardView {
  return [self initWithMainScreenFrameAndCardView:whiteCardView];
}

- (void)initProperties {
  self.textColor = Constants.BlackColor;
}

- (WhiteCardView *)whiteCardView {
  if ([self.cardView isKindOfClass:WhiteCardView.class]) {
    return (WhiteCardView *)self.cardView;
  }

  return nil;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
  BOOL isNil = newSuperview == nil;
  BOOL isKindOfWhiteCardView = [newSuperview isKindOfClass:WhiteCardView.class];

  unless(isNil || isKindOfWhiteCardView) {
    [NSException raise:@"SuperviewTypeError"
                format:@"WhiteCardTextView.superview must be a kind of WhiteCardView, not %@",
                       newSuperview.class];
  }
}
@end
