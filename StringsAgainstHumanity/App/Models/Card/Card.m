//
//  Card.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "Card.h"

@interface Card ()

@end

@implementation Card

- (instancetype)init {
  self = [super init];

  [self initVariables];

  return self;
}

- (void)initVariables {
  [self initString];
}

- (void)initString {
  _string = [NSString string];
}

- (instancetype)initWithString:(NSString *)string {
  self = [self init];

  _string = [string copy];

  return self;
}

@end
