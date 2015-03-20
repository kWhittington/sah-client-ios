//
//  PlaymatController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/19/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import UIKit;

@class BlackCardController;
@class HandController;
@class BlackCard;
@class Hand;

@interface PlaymatController : UIViewController
@property(readonly, strong, nonatomic) BlackCardController *blackCardController;
@property(readonly, strong, nonatomic) HandController *handController;

+ (BlackCard *)StartingBlackCard;
+ (Hand *)StartingHand;
+ (NSString *)StoryboardID;

+ (instancetype)empty;

- (NSString *)debugDescription;
- (NSString *)description;
@end
