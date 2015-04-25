//
//  CardView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/20/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import UIKit;

@class Card;

@interface CardView : UIView <NSCopying>
@property(readonly, nonatomic) Card *card;

+ (instancetype)withFrame:(CGRect)frame;
+ (instancetype)withFrame:(CGRect)frame andCard:(Card *)card;
+ (instancetype)withMainScreenFrameAndCard:(Card *)card;

- (instancetype)initWithFrame:(CGRect)frame andCard:(Card *)card;
- (instancetype)initWithMainScreenFrameAndCard:(Card *)card;

- (BOOL)isEqualToCardView:(CardView *)other;
@end
