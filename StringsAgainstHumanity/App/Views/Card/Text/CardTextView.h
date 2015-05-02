//
//  CardTextView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/20/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import UIKit;

@class CardView;

@interface CardTextView : UITextView
+ (instancetype)withFrame:(CGRect)frame;
+ (instancetype)withFrame:(CGRect)frame andCardView:(CardView *)cardView;
+ (instancetype)withMainScreenFrameAndCardView:(CardView *)cardView;

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andCardView:(CardView *)cardView;
- (instancetype)initWithMainScreenFrameAndCardView:(CardView *)cardView;

- (CardView *)cardView;
@end
