//
//  HandView.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/20/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CardCell;

@interface HandView : UICollectionView

- (CardCell *)dequeueReusableCardCellForIndexPath:(NSIndexPath *)indexPath;

@end
