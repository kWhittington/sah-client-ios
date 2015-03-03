//
//  HandController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"

@class Card;

@interface HandController : UICollectionViewController
@property(readonly, strong) Card *blackCard;

+ (NSString *)storyboardID;

- (void)addCard:(Card *)card;
- (void)setBlackCardString:(NSString *)string;

@end
