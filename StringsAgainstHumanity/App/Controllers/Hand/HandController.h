//
//  HandController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hand;

@interface HandController : UICollectionViewController

@property(strong, readonly) Hand *hand;

@end
