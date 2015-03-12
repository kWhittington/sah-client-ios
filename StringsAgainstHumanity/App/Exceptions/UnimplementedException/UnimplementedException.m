//
//  UnimplementedException.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "UnimplementedException.h"

@implementation UnimplementedException
+ (instancetype)withSelector:(SEL)selector {
  NSString *name = NSStringFromClass(UnimplementedException.class);
  NSString *selectorString = NSStringFromSelector(selector);
  NSString *reason = NSStringWithFormat(@"%@ must be implemented in a subclass", selectorString);

  return [[UnimplementedException alloc] initWithName:name reason:reason userInfo:nil];
}
@end
