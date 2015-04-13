//
//  BlackCardSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "BlackCard.h"
#import "BlackCardView.h"

SPEC_BEGIN(BlackCardViewSpec)
describe(@"BlackCardView", ^{
  let(initFrame, ^NSValue *{
    return [NSValue valueWithCGRect:CGRectZero];
  });

  let(blackCardView, ^BlackCardView *{
    return [[BlackCardView alloc] initWithFrame:initFrame.CGRectValue];
  });

  specify(^{
    [[blackCardView should] beKindOfClass:UIView.class];
  });

  specify(^{
    [[blackCardView should] beMemberOfClass:BlackCardView.class];
  });
});
SPEC_END
