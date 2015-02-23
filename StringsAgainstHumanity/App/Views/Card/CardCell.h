//
//  CardCell.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Card;

@interface CardCell : UICollectionViewCell

@property(readonly, strong) Card *card;
@property(weak, nonatomic) IBOutlet UILabel *label;

+ (NSString *)reusableID;
+ (NSNumber *)width;
+ (NSNumber *)height;
+ (CGSize)size;

- (void)configureForCard:(Card *)card;
- (void)showSelectedState;
- (void)showDeselectedState;

@end
