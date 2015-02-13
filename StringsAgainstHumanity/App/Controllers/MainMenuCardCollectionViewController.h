//
//  CardCollectionViewController.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/9/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuCardCollectionViewController : UICollectionViewController <NSCopying>

@property(readonly) NSArray *cards;

@end
