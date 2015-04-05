//
//  WhiteCard.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/5/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "WhiteCard.h"

@implementation WhiteCard
- (NSString *)description {
  return NSStringWithFormat(@"<WhiteCard: %p; string = %@; playAction = %@>", self, self.string,
                            self.playAction);
}

- (BOOL)isEqual:(id)object {
  if ([self isIdenticalTo:object]) {
    return YES;
  }

  unless([object isKindOfClass:self.class]) { return NO; }

  return [self isEqualToWhiteCard:(WhiteCard *)object];
}

- (BOOL)isEqualToWhiteCard:(WhiteCard *)other {
  return [self isEqualToCard:other];
}

@end
