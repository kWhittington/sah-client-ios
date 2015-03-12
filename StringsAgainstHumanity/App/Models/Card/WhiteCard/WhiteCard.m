//
//  WhiteCard.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/5/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "WhiteCard.h"

@implementation WhiteCard
- (instancetype)copyWithZone:(NSZone *)zone {
  WhiteCard *card = [WhiteCard withString:self.string.copy];

  return card;
}

- (BOOL)isEqual:(id)object {
  BOOL equalToSuperClass = [super isEqual:object];

  unless(equalToSuperClass) { return NO; }

  return [self isEqualToWhiteCard:(WhiteCard *)object];
}

- (BOOL)isEqualToWhiteCard:(WhiteCard *)other {
  return [self.string isEqualToString:other.string];
}
@end
