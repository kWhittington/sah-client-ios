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

  describe(@"+ BlackColor", ^{
    let(result, ^{
      return Constants.BlackColor;
    });

    let(SAHBlackColor, ^UIColor *{
      return [UIColor colorWithHexString:@"#1A1818"];
    });

    specify(^{
      [[result should] equal:SAHBlackColor];
    });
  });

  describe(@"+ Storyboard", ^{
    let(result, ^{
      return Constants.Storyboard;
    });

    specify(^{
      [[result should] beMemberOfClass:UIStoryboard.class];
    });
  });

  describe(@"+ StoryboardName", ^{
    let(result, ^{
      return Constants.StoryboardName;
    });

    specify(^{
      [[result should] equal:@"Main"];
    });
  });

  describe(@"+ WhiteColor", ^{
    let(result, ^{
      return Constants.WhiteColor;
    });

    let(SAHWhiteColor, ^UIColor *{
      return [UIColor colorWithHexString:@"FFFFFF"];
    });

    specify(^{
      [[result should] equal:SAHWhiteColor];
    });
  });
});
SPEC_END
