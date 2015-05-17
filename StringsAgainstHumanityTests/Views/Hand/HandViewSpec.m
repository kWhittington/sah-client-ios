//
//  HandViewSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/10/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"

#import "HandView.h"

SPEC_BEGIN(HandViewSpec)
describe(@"HandView", ^{
  let(handView, ^HandView *{
    return FGBuild(HandView.class);
  });

  it(@"is a UICollectionView", ^{
    [[handView should] beKindOfClass:UICollectionView.class];
  });
});
SPEC_END
