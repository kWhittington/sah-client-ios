//
//  Card.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"
#import "Card.h"
#import "PlayAction.h"

@interface Card ()
@property(nonatomic) PlayAction *playAction;
@property(nonatomic) NSString *string;
@end

@implementation Card
+ (UIColor *)CardColor {
  return Constants.WhiteColor;
}

+ (UIColor *)StringColor {
  return Constants.BlackColor;
}

+ (instancetype)blank {
  return [[self alloc] init];
}

+ (instancetype)withString:(NSString *)string {
  return [[self alloc] initWithString:string];
}

+ (instancetype)withString:(NSString *)string andAction:(void (^)(Card *))action {
  return [[self alloc] initWithString:string andAction:action];
}

- (instancetype)copyWithZone:(NSZone *)zone {
  return [Card withString:self.string.copy andAction:self.playAction.action];
}

- (NSString *)debugDescription {
  return self.description;
}

- (NSString *)description {
  return NSStringWithFormat(@"<Card: %p; string = %@>", self, self.string);
}

- (NSUInteger)hash {
  return self.string.hash;
}

- (instancetype)init {
  return [self initWithString:@""
                    andAction:^(Card *card){
                    }];
}

- (instancetype)initWithString:(NSString *)string {
  return [self initWithString:string
                    andAction:^(Card *card){
                    }];
}

#pragma mark Designated Initializer
- (instancetype)initWithString:(NSString *)string andAction:(void (^)(Card *))action {
  self = [super init];

  self.string = [string copy];
  self.playAction = [PlayAction withCard:self andAction:action];

  return self;
}

- (BOOL)isEqual:(id)object {
  if (self == object) {
    return YES;
  }

  unless([object isKindOfClass:self.class]) { return NO; }

  return [self isEqualToCard:(Card *)object];
}

- (BOOL)isEqualToCard:(Card *)card {
  BOOL stringsAreEqual = [self.string isEqualToString:card.string];

  return stringsAreEqual;
}
@end
