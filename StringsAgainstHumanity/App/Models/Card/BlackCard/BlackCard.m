//
//  BlackCard.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/4/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"
#import "BlackCard.h"

@interface BlackCard ()
@property(nonatomic) NSNumber *draw;
@property(nonatomic) NSNumber *pick;
@end

@implementation BlackCard
+ (UIColor *)CardColor {
  return Constants.BlackColor;
}

+ (NSNumber *)DefaultDrawNumber {
  return @0;
}

+ (NSNumber *)DefaultPickNumber {
  return @1;
}

+ (UIColor *)StringColor {
  return Constants.WhiteColor;
}

- (instancetype)copyWithZone:(NSZone *)zone {
  BlackCard *copy = [BlackCard withString:self.string.copy];

  return copy;
}

- (NSString *)debugDescription {
  return self.description;
}

- (NSString *)description {
  return NSStringWithFormat(@"<BlackCard: %p; string = %@>", self, self.string);
}

- (NSUInteger)hash {
  return self.string.hash ^ self.draw.hash ^ self.pick.hash;
}

#pragma mark Designated Initializer
- (instancetype)initWithString:(NSString *)string andAction:(void (^)(Card *))action {
  self = [super initWithString:string andAction:action];

  self.draw = BlackCard.DefaultDrawNumber;
  self.pick = BlackCard.DefaultPickNumber;

  return self;
}

- (BOOL)isEqual:(id)object {
  BOOL equalToSuperClass = [super isEqual:object];

  unless(equalToSuperClass) { return NO; }

  return [self isEqualToBlackCard:(BlackCard *)object];
}

- (BOOL)isEqualToBlackCard:(BlackCard *)other {
  BOOL stringsAreEqual = [self.string isEqualToString:other.string];
  BOOL drawsAreEqual = [self.draw isEqualToNumber:other.draw];
  BOOL picksAreEqual = [self.pick isEqualToNumber:other.pick];

  return stringsAreEqual && drawsAreEqual && picksAreEqual;
}
@end
