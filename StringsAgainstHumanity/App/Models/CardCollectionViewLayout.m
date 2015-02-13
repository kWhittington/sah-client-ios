//
//  CardCollectionViewLayout.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/9/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardCollectionViewLayout.h"
#import "MainMenuPlayCardViewCell.h"

@implementation CardCollectionViewLayout

- (void)awakeFromNib {

  [self assignSelfAsDelegate];
}

- (void)assignSelfAsDelegate {
  self.collectionView.delegate = self;
}

- (void)prepareLayout {
  //  self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  //  self.minimumLineSpacing = 100;
  //  self.minimumInteritemSpacing = 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return [self shrinkToViewSizeMaintainingRatio:[MainMenuPlayCardViewCell size]];
}

- (CGSize)shrinkToViewSizeMaintainingRatio:(CGSize)largeSize {
  CGSize shrunkSize = CGSizeMake(0, self.collectionView.bounds.size.height);

  float heightReducationPercentage = shrunkSize.height / largeSize.height;

  shrunkSize.width = largeSize.width * heightReducationPercentage;

  return shrunkSize;
}

@end
