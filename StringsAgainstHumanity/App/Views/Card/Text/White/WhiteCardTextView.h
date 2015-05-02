//
//  WhiteCardTextView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardTextView.h"

@class WhiteCardView;

@interface WhiteCardTextView : CardTextView
+ (instancetype)withFrame:(CGRect)frame andWhiteCardView:(WhiteCardView *)whiteCardView;
+ (instancetype)withMainScreenFrameAndWhiteCardView:(WhiteCardView *)whiteCardView;

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andWhiteCardView:(WhiteCardView *)whiteCardView;
- (instancetype)initWithMainScreenFrameAndWhiteCardView:(WhiteCardView *)whiteCardView;

- (WhiteCardView *)whiteCardView;
@end
