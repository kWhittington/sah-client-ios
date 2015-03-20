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

@interface PlaymatController : UIViewController
@property(readonly, strong, nonatomic) BlackCardController *blackCardController;
@property(readonly, strong, nonatomic) HandController *handController;

+ (NSString *)StoryboardID;

+ (instancetype)empty;

- (NSString *)debugDescription;
- (NSString *)description;
@end
