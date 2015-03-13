//
//  BlackCardController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import UIKit;

@class BlackCard;

@interface BlackCardController : UIViewController
@property(readonly, copy, nonatomic) BlackCard *blackCard;
@property(strong, nonatomic) IBOutlet UILabel *label;

+ (NSString *)StoryboardID;

+ (instancetype)withBlackCard:(BlackCard *)blackCard;
@end
