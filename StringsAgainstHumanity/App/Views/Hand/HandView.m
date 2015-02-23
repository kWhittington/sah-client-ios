//
//  HandView.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/20/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "HandView.h"
#import "HandViewDataSource.h"
#import "CardCell.h"
#import "Card.h"

@implementation HandView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
  self = [super init];

  NSLog(@"Init");

  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  NSLog(@"Init With Frame");

  return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];

  NSLog(@"Init with Coder");

  return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
  self = [super initWithFrame:frame collectionViewLayout:layout];

  NSLog(@"Init With Frame and CollectionViewLayout");

  return self;
}

- (CardCell *)dequeueReusableCardCellForIndexPath:(NSIndexPath *)indexPath {
  return [self dequeueReusableCellWithReuseIdentifier:@"CardCell" forIndexPath:indexPath];
}

@end
