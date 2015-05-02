//
//  CardView.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/20/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardView.h"
#import "Card.h"
#import "CardTextView.h"

@interface CardView ()
@property(nonatomic) Card *card;
@end

@implementation CardView
+ (instancetype)withFrame:(CGRect)frame {
  return [[self alloc] initWithFrame:frame];
}

+ (instancetype)withFrame:(CGRect)frame andCard:(Card *)card {
  return [[self alloc] initWithFrame:frame andCard:card];
}

+ (instancetype)withMainScreenFrameAndCard:(Card *)card {
  return [[self alloc] initWithMainScreenFrameAndCard:card];
}

- (instancetype)copyWithZone:(NSZone *)zone {
  return [[self.class alloc] initWithFrame:self.frame andCard:self.card.copy];
}

- (instancetype)initWithFrame:(CGRect)frame {
  return [self initWithFrame:frame andCard:[Card withString:@"Made by CardView - initWithFrame"]];
}

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andCard:(Card *)card {
  self = [super initWithFrame:frame];

  if (self) {
    [self initVariablesWithCard:card];
  }

  return self;
}

- (instancetype)initWithMainScreenFrameAndCard:(Card *)card {
  return [self initWithFrame:[[UIScreen mainScreen] bounds] andCard:card];
}

- (NSString *)description {
  return NSStringWithFormat(@"<CardView: %p; card = %@>", self, self.card);
}

- (void)initCard:(Card *)card {
  self.card = card;
}

- (void)initCardTextView {
  self.cardTextView = [CardTextView withFrame:self.frame andCardView:self];
}

- (void)initVariablesWithCard:(Card *)card {
  [self initCard:card];
  [self initCardTextView];
}

- (BOOL)isEqual:(id)object {
  if ([self isIdenticalTo:object]) {
    return YES;
  }

  unless([object isKindOfClass:self.class]) { return NO; }

  return [self isEqualToCardView:(CardView *)object];
}

- (BOOL)isEqualToCardView:(CardView *)other {
  BOOL haveEqualCards = [self.card isEqualToCard:other.card];

  return haveEqualCards;
}

- (void)setCardTextView:(CardTextView *)cardTextView {
  _cardTextView = cardTextView;

  [_cardTextView makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(44, 44, 44, 44));
  }];
}
@end
