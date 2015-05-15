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

  describe(@"- finalLayoutAttributesForDisappearingItemAtIndexPath:", ^{
    let(finalLayoutAttributesForDisappearingItemAtIndexPath, ^{
      return [birdsEyeHandLayout
        finalLayoutAttributesForDisappearingItemAtIndexPath:[NSIndexPath indexPathWithIndex:32]];
    });

    it(@"has a northward transformation", ^{
      finalLayoutAttributesForDisappearingItemAtIndexPath;
      [[theValue(finalLayoutAttributesForDisappearingItemAtIndexPath.transform.ty) should]
        beLessThan:theValue(0)];
    });
  });
});
SPEC_END
