//
//  Card.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "Card.h"

@interface Card ()

@property(strong) NSString *string;

@end

@implementation Card

+ (instancetype)blank {
  return [[self alloc] initWithString:@""];
}

+ (instancetype)withString:(NSString *)string {
  return [[self alloc] initWithString:string];
}

- (instancetype)init {
  self = [self initWithString:@""];

  return self;
}

#pragma mark Designated Initializer
- (instancetype)initWithString:(NSString *)string {
  self = [super init];

  self.string = [string copy];

  return self;
}

- (instancetype)copyWithZone:(NSZone *)zone {
  Card *copy = [Card withString:self.string.copy];

  return copy;
}

- (NSUInteger)hash {
  return self.string.hash;
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
