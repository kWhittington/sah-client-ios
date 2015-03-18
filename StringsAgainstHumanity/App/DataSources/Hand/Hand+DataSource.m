//
//  Hand+DataSource.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/27/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "Hand+DataSource.h"
#import "CardViewCell.h"
#import "Card.h"

@implementation Hand (DataSource)
- (Card *)cardAtIndexPath:(NSIndexPath *)indexPath {
  return [self cardAtIndex:indexPath.row];
}

- (NSArray *)cardsAtIndexPaths:(NSArray *)indexPaths {
  NSMutableIndexSet *indexes = [NSMutableIndexSet indexSet];

  [indexPaths each:^(NSIndexPath *indexPath) {
    [indexes addIndex:indexPath.item];
  }];

  return [self cardsAtIndexes:indexes];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  // We only have one section in a Hand.
  return self.size;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell =
    [self collectionView:collectionView cardCellForItemAtIndexPath:indexPath];
  return cell;
}

- (CardViewCell *)collectionView:(UICollectionView *)collectionView
      cardCellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CardViewCell *cardCell =
    [self collectionView:collectionView dequeueCardCellForIndexPath:indexPath];

  [cardCell configureForCard:[self cardAtIndexPath:indexPath]];

  return cardCell;
}

- (CardViewCell *)collectionView:(UICollectionView *)collectionView
     dequeueCardCellForIndexPath:(NSIndexPath *)indexPath {
  return [collectionView dequeueReusableCellWithReuseIdentifier:[CardViewCell reusableID]
                                                   forIndexPath:indexPath];
}

- (NSIndexPath *)indexPathOfCard:(Card *)card {
  NSInteger index = [self indexOfCard:card];

  return [NSIndexPath indexPathForItem:index inSection:0];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  // We will always only have one section.
  return 1;
}

- (void)removeCardsAtIndexPaths:(NSArray *)indexPaths {
  NSMutableIndexSet *indexes = [NSMutableIndexSet indexSet];

  [indexPaths each:^(NSIndexPath *indexPath) {
    [indexes addIndex:indexPath.item];
  }];

  [self removeCardsAtIndexes:indexes];
}
@end
