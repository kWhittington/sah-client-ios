//
//  HandViewDataSource.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/20/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class Card;
@class CardCell;

@interface HandViewDataSource : NSObject <UICollectionViewDataSource>

- (Card *)cardAtIndexPath:(NSIndexPath *)indexPath;
- (NSArray *)cardsAtIndexPaths:(NSArray *)indexPaths;
- (void)deleteCards:(NSArray *)cards;
- (void)deleteCardsAtIndexPaths:(NSArray *)indexPaths;
- (CardCell *)collectionView:(UICollectionView *)collectionView
  cardCellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
