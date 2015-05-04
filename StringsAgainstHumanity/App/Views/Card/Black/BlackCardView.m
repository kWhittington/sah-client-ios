//
//  BlackCardView.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "BlackCard.h"
#import "BlackCardView.h"

@interface BlackCardView ()
@end

@implementation BlackCardView
+ (instancetype)withFrame:(CGRect)frame andBlackCard:(BlackCard *)blackCard {
  return [[self alloc] initWithFrame:frame andBlackCard:blackCard];
}

+ (instancetype)withMainScreenFrameAndBlackCard:(BlackCard *)blackCard {
  return [[self alloc] initWithMainScreenFrameAndBlackCard:blackCard];
}

- (instancetype)initWithFrame:(CGRect)frame andCard:(Card *)card {
  unless([card isKindOfClass:BlackCard.class]) {
    [NSException raise:@"CardTypeException"
                format:@"BlackCardView.card must be assigned a BlackCard, not %@", card.class];
  }

  return [self initWithFrame:frame andBlackCard:(BlackCard *)card];
}

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andBlackCard:(BlackCard *)blackCard {
  self = [super initWithFrame:frame andCard:blackCard];

  [self initProperties];

  return self;
}

- (instancetype)initWithMainScreenFrameAndBlackCard:(BlackCard *)blackCard {
  return [self initWithFrame:UIScreen.mainScreen.bounds andBlackCard:blackCard];
}

- (void)initProperties {
  self.backgroundColor = Constants.BlackColor;
}
@end
