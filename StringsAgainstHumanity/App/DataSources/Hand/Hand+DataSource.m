//
//  Hand+DataSource.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/27/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "Hand+DataSource.h"
#import "CardCell.h"
#import "Card.h"

@implementation Hand (DataSource)
- (Card *)cardAtIndexPath:(NSIndexPath *)indexPath {
  return [self cardAtIndex:indexPath.row];
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

- (CardCell *)collectionView:(UICollectionView *)collectionView
  cardCellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CardCell *cardCell = [self collectionView:collectionView dequeueCardCellForIndexPath:indexPath];

  [cardCell configureForCard:[self cardAtIndexPath:indexPath]];

  return cardCell;
}

- (CardCell *)collectionView:(UICollectionView *)collectionView
  dequeueCardCellForIndexPath:(NSIndexPath *)indexPath {
  return [collectionView dequeueReusableCellWithReuseIdentifier:[CardCell reusableID]
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
@end
