//
//  BlackCardViewController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardViewController.h"

@class BlackCard;
@class BlackCardView;

@interface BlackCardViewController : CardViewController
+ (instancetype)withBlackCard:(BlackCard *)blackCard;

#pragma mark Designated Initializer
- (instancetype)initWithBlackCard:(BlackCard *)blackCard;

- (BlackCard *)blackCard;
- (BlackCardView *)blackCardView;
@end
