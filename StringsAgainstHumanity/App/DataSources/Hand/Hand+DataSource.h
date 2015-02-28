//
//  Hand+DataSource.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/27/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "Hand.h"

@class Card;

@interface Hand (DataSource) <UICollectionViewDataSource>

- (Card *)cardAtIndexPath:(NSIndexPath *)indexPath;
- (NSArray *)cardsAtIndexPaths:(NSArray *)indexPaths;
- (NSIndexPath *)indexPathOfCard:(Card *)card;
- (void)removeCardsAtIndexPaths:(NSArray *)indexPaths;

@end
