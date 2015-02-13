//
//  CardCollectionViewCell.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/9/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "MainMenuPlayCardViewCell.h"

@interface MainMenuPlayCardViewCell ()

@property(weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation MainMenuPlayCardViewCell

+ (NSNumber *)width {
  return @340;
}

+ (NSNumber *)height {
  return @475;
}

+ (CGSize)size {
  return CGSizeMake([MainMenuPlayCardViewCell width].floatValue,
                    [MainMenuPlayCardViewCell height].floatValue);
}

- (void)awakeFromNib {
  [super awakeFromNib];
}

@end
