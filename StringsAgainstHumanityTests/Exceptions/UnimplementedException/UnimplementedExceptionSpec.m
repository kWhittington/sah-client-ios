//
//  UnimplementedExceptionSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "UnimplementedException.h"

SPEC_BEGIN(UnimplementedExceptionSpec)
describe(@"UnimplementedExceptionSpec", ^{
  let(unimplementedException, ^UnimplementedException *{
    return [UnimplementedException withSelector:@selector(test)];
  });

  describe(@"+ withSelector:", ^{
    let(result, ^{
      return [UnimplementedException withSelector:@selector(test)];
    });

    it(@"returns an UnimplementedException", ^{
      [[result should] beMemberOfClass:UnimplementedException.class];
    });
  });

  describe(@"- name", ^{
    let(result, ^{
      return unimplementedException.name;
    });

    it(@"returns UnimplementedException", ^{
      [[result should] equal:NSStringFromClass(UnimplementedException.class)];
    });
  });

  describe(@"- reason", ^{
    let(result, ^{
      return unimplementedException.reason;
    });

    let(expected, ^{
      return NSStringWithFormat(@"%@ must be implemented in a subclass",
                                NSStringFromSelector(@selector(test)));
    });

    it(@"returns '[Method] must be implemented in a subclass", ^{
      [[result should] equal:expected];
    });
  });
});
SPEC_END
