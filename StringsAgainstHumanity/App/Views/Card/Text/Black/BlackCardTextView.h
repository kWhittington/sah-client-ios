//
//  BlackCardTextView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/3/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardTextView.h"

@class BlackCardView;

@interface BlackCardTextView : CardTextView
+ (instancetype)withFrame:(CGRect)frame andBlackCardView:(BlackCardView *)blackCardView;
+ (instancetype)withMainScreenFrameAndBlackCardView:(BlackCardView *)blackCardView;

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andBlackCardView:(BlackCardView *)blackCardView;
- (instancetype)initWithMainScreenFrameAndBlackCardView:(BlackCardView *)blackCardView;

- (BlackCardView *)blackCardView;
@end
