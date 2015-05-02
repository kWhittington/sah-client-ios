//
//  WhiteCardView.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "WhiteCard.h"
#import "WhiteCardView.h"

@implementation WhiteCardView
+ (instancetype)withFrame:(CGRect)frame andWhiteCard:(WhiteCard *)whiteCard {
  return [[self alloc] initWithFrame:frame andWhiteCard:whiteCard];
}

+ (instancetype)withMainScreenFrameAndWhiteCard:(WhiteCard *)whiteCard {
  return [[self alloc] initWithMainScreenFrameAndWhiteCard:whiteCard];
}

- (instancetype)initWithFrame:(CGRect)frame andCard:(Card *)card {
  unless([card isKindOfClass:WhiteCard.class]) {
    [NSException raise:@"CardTypeException"
                format:@"WhiteCardView.card must be assigned a WhiteCard, not %@", card.class];
  }

  return [self initWithFrame:frame andWhiteCard:(WhiteCard *)card];
}

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andWhiteCard:(WhiteCard *)whiteCard {
  self = [super initWithFrame:frame andCard:whiteCard];

  [self initProperties];

  return self;
}

- (instancetype)initWithMainScreenFrameAndWhiteCard:(WhiteCard *)whiteCard {
  return [self initWithFrame:UIScreen.mainScreen.bounds andWhiteCard:whiteCard];
}

- (void)initProperties {
  self.backgroundColor = Constants.WhiteColor;
}
@end
