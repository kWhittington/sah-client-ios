//
//  WhiteCardView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardView.h"

@class WhiteCard;
@class WhiteCardTextView;

@interface WhiteCardView : CardView
+ (instancetype)withFrame:(CGRect)frame andWhiteCard:(WhiteCard *)whiteCard;
+ (instancetype)withMainScreenFrameAndWhiteCard:(WhiteCard *)whiteCard;

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andWhiteCard:(WhiteCard *)whiteCard;
- (instancetype)initWithMainScreenFrameAndWhiteCard:(WhiteCard *)whiteCard;

- (WhiteCardTextView *)whiteCardTextView;
@end
