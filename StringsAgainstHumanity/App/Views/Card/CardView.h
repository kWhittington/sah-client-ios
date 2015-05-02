//
//  CardView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/20/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import UIKit;

@class Card;
@class CardTextView;

@interface CardView : UIView <NSCopying>
@property(nonatomic, readonly) Card *card;
@property(nonatomic, weak) CardTextView *cardTextView;

+ (instancetype)withFrame:(CGRect)frame;
+ (instancetype)withFrame:(CGRect)frame andCard:(Card *)card;
+ (instancetype)withMainScreenFrameAndCard:(Card *)card;

- (instancetype)initWithFrame:(CGRect)frame andCard:(Card *)card;
- (instancetype)initWithMainScreenFrameAndCard:(Card *)card;

- (BOOL)isEqualToCardView:(CardView *)other;
@end
