//
//  WhiteCardViewController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardViewController.h"

@class WhiteCard;

@interface WhiteCardViewController : CardViewController
+ (instancetype)withWhiteCard:(WhiteCard *)whiteCard;

#pragma mark Designated Initializer
- (instancetype)initWithWhiteCard:(WhiteCard *)whiteCard;
@end
