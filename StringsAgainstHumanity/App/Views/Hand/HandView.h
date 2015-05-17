//
//  HandView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/10/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
//  Presents cards from a hand to the screen for view, selection, and playing.

@import UIKit;

@interface HandView : UICollectionView
+ (instancetype)withFrame:(CGRect)frame;
+ (instancetype)withMainScreenFrame;

- (instancetype)initWithMainScreenFrame;
@end
