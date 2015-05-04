//
//  BlackCardView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardView.h"

@class BlackCard;
@class BlackCardTextView;

@interface BlackCardView : CardView
+ (instancetype)withFrame:(CGRect)frame andBlackCard:(BlackCard *)blackCard;
+ (instancetype)withMainScreenFrameAndBlackCard:(BlackCard *)blackCard;

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andBlackCard:(BlackCard *)blackCard;
- (instancetype)initWithMainScreenFrameAndBlackCard:(BlackCard *)blackCard;
@end
