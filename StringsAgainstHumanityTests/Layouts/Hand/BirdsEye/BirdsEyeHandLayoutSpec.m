//
//  BirdsEyeHandLayoutSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/11/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"

#import "BirdsEyeHandLayout.h"

SPEC_BEGIN(BirdsEyeHandLayoutSpec)
describe(@"BirdsEyeHandLayout", ^{
  let(birdsEyeHandLayout, ^BirdsEyeHandLayout *{
    return FGBuild(BirdsEyeHandLayout.class);
  });
});
SPEC_END
