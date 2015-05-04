//
//  BlackCard.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/4/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"
#import "BlackCard.h"
#import "PlayAction.h"

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

- (NSString *)debugDescription {
  return self.description;
}

- (NSString *)description {
  return NSStringWithFormat(@"<BlackCard: %p; string = %@; playAction = %@>", self, self.string,
                            self.playAction);
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
  if (self == object) {
    return YES;
  }

  unless([object isKindOfClass:self.class]) { return NO; }

  return [self isEqualToBlackCard:(BlackCard *)object];
}

- (BOOL)isEqualToBlackCard:(BlackCard *)other {
  BOOL cardAttributesAreEqual = [self isEqualToCard:other];
  BOOL drawsAreEqual = [other.draw isEqualToNumber:self.draw];
  BOOL picksAreEqual = [other.pick isEqualToNumber:self.pick];

  return cardAttributesAreEqual && drawsAreEqual && picksAreEqual;
}
@end
