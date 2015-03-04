//
//  ConstantsSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/3/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "Constants.h"

SPEC_BEGIN(ConstantsSpec)
describe(@"Constants", ^{
  it(@"cannot be instantiated", ^{
    [[theBlock(^{
      [Constants new];
    }) should] raise];
  });

  describe(@"+ StoryboardName", ^{
    let(result, ^{
      return Constants.StoryboardName;
    });

    specify(^{
      [[result should] equal:@"Main"];
    });
  });
});
SPEC_END
