//
//  BlackCardView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import UIKit;

@class BlackCard;

@interface BlackCardView : UIView
@property(readonly, nonatomic) BlackCard *blackCard;
@property(readonly, nonatomic) UILabel *textLabel;

- (instancetype)initWithFrame:(CGRect)frame andBlackCard:(BlackCard *)blackCard;
@end
