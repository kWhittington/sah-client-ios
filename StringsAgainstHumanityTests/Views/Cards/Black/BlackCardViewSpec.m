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
  let(blackCardView, ^{
    return FGBuild(BlackCardView.class);
  });

  it(@"is a kind of card view", ^{
    [[blackCardView should] beKindOfClass:CardView.class];
  });
});
SPEC_END
