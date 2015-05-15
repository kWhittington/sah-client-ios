//
//  BirdsEyeHandLayoutSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/11/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"

#import "BirdsEyeHandLayout.h"
#import "CardViewCell.h"

SPEC_BEGIN(BirdsEyeHandLayoutSpec)
describe(@"BirdsEyeHandLayout", ^{
  let(birdsEyeHandLayout, ^BirdsEyeHandLayout *{
    return FGBuild(BirdsEyeHandLayout.class);
  });

  describe(@".itemSize", ^{
    let(itemSize, ^{
      return theValue(birdsEyeHandLayout.itemSize);
    });

    it(@"is half the height of the mainScreen", ^{
      [[theValue(birdsEyeHandLayout.itemSize.height) should]
        equal:theValue(UIScreen.mainScreen.bounds.size.height / 2)];
    });

    it(@"maintains CardViewCell.size height/width ratio", ^{
      KWValue *ratio =
        theValue(birdsEyeHandLayout.itemSize.height / birdsEyeHandLayout.itemSize.width);
      KWValue *expectedRatio = theValue(CardViewCell.size.height / CardViewCell.size.width);

      [[ratio should] beWithin:theValue(0.001f) of:expectedRatio];
    });
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
