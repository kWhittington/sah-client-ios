//
//  CardCell.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardCell.h"
#import "Card.h"

@interface CardCell ()

@property(strong) Card *card;

@end

@implementation CardCell

+ (NSNumber *)width {
  return @340;
}

+ (NSNumber *)height {
  return @475;
}

+ (CGSize)size {
  return CGSizeMake([CardCell width].floatValue, [CardCell height].floatValue);
}

- (void)configureForCard:(Card *)card {
  self.card = card;

  self.label.text = card.string;
}

@end
