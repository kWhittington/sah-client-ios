//
//  PlaymatController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/19/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import UIKit;

@class BlackCardViewController;
@class HandViewController;
@class BlackCard;
@class Hand;

@interface PlaymatController : UIViewController
@property(readonly, strong, nonatomic) BlackCardViewController *blackCardViewController;
@property(readonly, strong, nonatomic) HandViewController *handViewController;

+ (BlackCard *)StartingBlackCard;

+ (instancetype)empty;

- (Hand *)startingHand;
@end
