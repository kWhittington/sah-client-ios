//
//  WhiteCardController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import UIKit;

@class WhiteCard;

@interface WhiteCardController : UIViewController
@property(readonly, copy, nonatomic) WhiteCard *whiteCard;
@property(strong, nonatomic) IBOutlet UILabel *label;

+ (instancetype)withWhiteCard:(WhiteCard *)whiteCard;
@end
