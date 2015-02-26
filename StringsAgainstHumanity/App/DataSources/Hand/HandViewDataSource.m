//
//  HandViewDataSource.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/20/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "HandViewDataSource.h"
#import "Hand.h"
#import "HandView.h"
#import "CardCell.h"
#import "Card.h"

@interface HandViewDataSource ()

@property(strong) Hand *hand;

@end

@implementation HandViewDataSource

- (instancetype)init {
  self = [super init];

  self.hand = [Hand testHand];

  return self;
}

- (Card *)cardAtIndexPath:(NSIndexPath *)indexPath {
  return [self.hand cardAtIndex:indexPath.row];
}

- (NSArray *)cardsAtIndexPaths:(NSArray *)indexPaths {
  return [indexPaths map:^(NSIndexPath *indexPath) {
    return [self cardAtIndexPath:indexPath];
  }];
}

- (void)deleteCard:(Card *)card {
  [self.hand removeCard:card];
}

- (void)deleteCards:(NSArray *)cards {
  [self.hand removeCardsInArray:cards];
}

- (void)deleteCardAtIndexPath:(NSIndexPath *)indexPath {
  [self.hand removeCardAtIndex:indexPath.row];
}

- (void)deleteCardsAtIndexPaths:(NSArray *)indexPaths {
  [indexPaths each:^(NSIndexPath *indexPath) {
    [self deleteCardAtIndexPath:indexPath];
  }];
}

#pragma mark <UICollectionViewDataSource>
// Apple Doc:
// https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/CollectionViewPGforIOS/CollectionViewPGforIOS.pdf
// If there will only be one section, numberOfSectionsInCollectionView is
// optional.
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//  return 0;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return [self.hand size];
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
@end
