//
//  HandController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "PrefixHeader.pch"

@class Card;

@interface HandController : UICollectionViewController
+ (NSString *)storyboardID;

- (void)addCard:(Card *)card;

@end
