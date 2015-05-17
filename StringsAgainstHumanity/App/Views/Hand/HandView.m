//
//  HandView.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/10/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "HandView.h"

@implementation HandView
- (instancetype)initWithMainScreenFrameAndCollectionViewLayout:(UICollectionViewLayout *)layout {
  return [self initWithFrame:UIScreen.mainScreen.bounds collectionViewLayout:layout];
}
@end
