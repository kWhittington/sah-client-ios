//
//  CardViewController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/1/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import UIKit;

@class Card;
@class CardView;

@interface CardViewController : UIViewController
@property(nonatomic, readonly) Card *card;

+ (instancetype)withCard:(Card *)card;

#pragma mark Designated Initializer
- (instancetype)initWithCard:(Card *)card;

- (CardView *)cardView;
- (BOOL)isEqualToCardViewController:(CardViewController *)other;
@end
