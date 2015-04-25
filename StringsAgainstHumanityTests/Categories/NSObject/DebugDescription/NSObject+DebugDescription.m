//
//  DebugDescription.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "NSObject+DebugDescription.h"

@interface DebugObject : NSObject

@end

@implementation DebugObject

- (NSString *)description {
  return @"This is only a test.";
}

@end

SPEC_BEGIN(NSObjectDebugDescriptionSpec)
describe(@"NSObject+DebugDescription", ^{
  let(debugObject, ^DebugObject *{
    return [DebugObject new];
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return [debugObject debugDescription];
    });

    it(@"equals - description", ^{
      [[debugDescription should] equal:[debugObject description]];
    });
  });
});
SPEC_END
