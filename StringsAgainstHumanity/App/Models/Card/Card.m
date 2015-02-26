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
  return [[Card alloc] init];
}

+ (instancetype)withString:(NSString *)string {
  return [[Card alloc] initWithString:string];
}

- (instancetype)init {
  self = [super init];

  [self initString];

  return self;
}

- (void)initString {
  self.string = [NSString string];
}

- (instancetype)initWithString:(NSString *)string {
  self = [self init];

  self.string = [string copy];

  return self;
}

@end
