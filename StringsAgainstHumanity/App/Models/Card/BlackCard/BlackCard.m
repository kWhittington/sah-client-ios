//
//  BlackCard.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/4/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "BlackCard.h"

@interface BlackCard ()
@property(strong) NSNumber *draw;
@property(strong) NSNumber *pick;
@end

@implementation BlackCard
+ (NSNumber *)DefaultDrawNumber {
  return @0;
}

+ (NSNumber *)DefaultPickNumber {
  return @1;
}

#pragma mark Designated Initializer
- (instancetype)initWithString:(NSString *)string {
  self = [super initWithString:string];

  self.draw = BlackCard.DefaultDrawNumber;
  self.pick = BlackCard.DefaultPickNumber;

  return self;
}

- (NSUInteger)hash {
  return self.string.hash ^ self.draw.hash ^ self.pick.hash;
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
