//
//  BirdsEyeHandLayout.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "BirdsEyeHandLayout.h"
#import "CardViewCell.h"

@interface BirdsEyeHandLayout ()
@property NSArray *updateActionDeleteItems;
@end

@implementation BirdsEyeHandLayout

- (instancetype)init {
  self = [super init];

  [self refresh];

  return self;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:
    (NSIndexPath *)itemIndexPath {
  UICollectionViewLayoutAttributes *attributes =
    [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:itemIndexPath];

  attributes.transform = (CGAffineTransform){.ty = -1};

  return attributes;
}

- (void)refresh {
  self.collectionView.decelerationRate = UIScrollViewDecelerationRateNormal;
  self.scrollDirection = UICollectionViewScrollDirectionHorizontal;

  [self refreshItemSize];
  [self refreshRowPosition];
}

- (void)refreshItemSize {
  self.itemSize = [self shrinkToHalfViewHeight:[CardViewCell size]];
}

- (void)refreshRowPosition {
  CGFloat height = [UIScreen mainScreen].bounds.size.height;

  float topInset = height / 2;
  float leftInset = 0;
  float bottomInset = 0;
  float rightInset = 0;

  self.sectionInset = UIEdgeInsetsMake(topInset, leftInset, bottomInset, rightInset);
}

- (CGSize)shrinkToHalfViewHeight:(CGSize)largeSize {
  CGFloat viewHeight = [UIScreen mainScreen].bounds.size.height;

  CGSize shrunkSize = CGSizeMake(0, viewHeight / 2);

  float heightReducationPercentage = shrunkSize.height / largeSize.height;

  shrunkSize.width = largeSize.width * heightReducationPercentage;

  return shrunkSize;
}
@end
