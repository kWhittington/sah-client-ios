//
//  NSObject+TypeChecking.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/14/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "NSObject+TypeChecking.h"

@implementation NSObject (TypeChecking)
- (BOOL)instanceOf:(Class) class {
  return [self isMemberOfClass:class];
}

- (BOOL)kindOf:(Class) class {
  return [self isKindOfClass:class];
} @end
