//
//  WhiteCardViewSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "CardView.h"
#import "WhiteCardView.h"

SPEC_BEGIN(WhiteCardViewSpec)
describe(@"WhiteCardView", ^{
  let(whiteCardView, ^WhiteCardView *{
    return FGBuild(WhiteCardView.class);
  });

  specify(^{
    [[whiteCardView should] beKindOfClass:CardView.class];
  });
});
SPEC_END
