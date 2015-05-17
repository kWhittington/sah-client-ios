//
//  HandView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/10/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import UIKit;

@interface HandView : UICollectionView
+ (instancetype)withFrame:(CGRect)frame;
+ (instancetype)withMainScreenFrame;

- (instancetype)initWithMainScreenFrame;
@end
