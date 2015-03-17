//
//  HandController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"

@class Hand;
@class WhiteCard;

@interface HandController : UICollectionViewController
@property(readonly, copy, nonatomic) Hand *hand;

+ (NSString *)StoryboardID;

+ (instancetype)empty;
+ (instancetype)withHand:(Hand *)hand;

- (void)addWhiteCard:(WhiteCard *)card;
@end
