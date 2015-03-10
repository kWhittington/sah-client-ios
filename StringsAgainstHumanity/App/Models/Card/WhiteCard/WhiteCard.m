//
//  WhiteCard.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/5/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "WhiteCard.h"

@implementation WhiteCard
- (BOOL)isEqual:(id)object {
  if (self == object) {
    return YES;
  }

  if (![object isKindOfClass:WhiteCard.class]) {
    return NO;
  }

  return [self isEqualToWhiteCard:(WhiteCard *)object];
}

- (BOOL)isEqualToWhiteCard:(WhiteCard *)other {
  return [self.string isEqual:other.string];
}
@end
