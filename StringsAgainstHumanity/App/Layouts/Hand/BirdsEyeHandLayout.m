//
//  BirdsEyeHandLayout.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "BirdsEyeHandLayout.h"
#import "CardCell.h"

@implementation BirdsEyeHandLayout

- (void)awakeFromNib {
  [super awakeFromNib];

  [self refreshItemSize];
  [self refreshRowPosition];
}

- (void)refreshItemSize {
  self.itemSize = [self shrinkToHalfViewHeight:[CardCell size]];
}

- (CGSize)shrinkToHalfViewHeight:(CGSize)largeSize {
  CGFloat viewHeight = [UIScreen mainScreen].bounds.size.height;

  CGSize shrunkSize = CGSizeMake(0, viewHeight / 2);

  float heightReducationPercentage = shrunkSize.height / largeSize.height;

  shrunkSize.width = largeSize.width * heightReducationPercentage;

  return shrunkSize;
}

- (void)refreshRowPosition {
  CGFloat height = [UIScreen mainScreen].bounds.size.height;

  float topInset = height / 2;
  float leftInset = 0;
  float bottomInset = 0;
  float rightInset = 0;

  self.sectionInset = UIEdgeInsetsMake(topInset, leftInset, bottomInset, rightInset);
}

@end
