//
//  ZoomInHandLayout.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "ZoomInHandLayout.h"
#import "CardCell.h"

@implementation ZoomInHandLayout
- (instancetype)init {
  self = [super init];

  [self refresh];

  return self;
}

- (void)awakeFromNib {
  [super awakeFromNib];

  [self refresh];
}

- (void)refresh {
  self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;

  [self refreshItemSize];
  [self refreshItemPosition];
}

- (void)refreshItemSize {
  self.itemSize = [self growToFullViewHeight:[CardCell size]];
}

- (CGSize)growToFullViewHeight:(CGSize)smallSize {
  CGSize grownSize = CGSizeMake(0, [UIScreen mainScreen].bounds.size.height);

  float heightIncreasePercentage = grownSize.height / smallSize.height;

  grownSize.width = smallSize.width * heightIncreasePercentage;

  grownSize.width = MAX(grownSize.width, [UIScreen mainScreen].bounds.size.width);

  return grownSize;
}

- (void)refreshItemPosition {
  self.itemSize =
      CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
  self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
  self.minimumInteritemSpacing = 10.0f;
  self.minimumLineSpacing = 10.0f;
  self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds {
  return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
                                 withScrollingVelocity:(CGPoint)velocity {
  CGFloat offsetAdjustment = MAXFLOAT;
  CGFloat horizontalCenter = proposedContentOffset.x + (self.itemSize.width / 2.0);

  CGRect targetRect =
      CGRectMake(proposedContentOffset.x, 0.0, self.itemSize.width, self.itemSize.height);
  NSArray *array = [self layoutAttributesForElementsInRect:targetRect];

  for (UICollectionViewLayoutAttributes *layoutAttributes in array) {
    CGFloat itemHorizontalCenter = layoutAttributes.center.x;
    if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
      offsetAdjustment = itemHorizontalCenter - horizontalCenter;

      layoutAttributes.alpha = 0;
    }
  }
  return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}

@end
