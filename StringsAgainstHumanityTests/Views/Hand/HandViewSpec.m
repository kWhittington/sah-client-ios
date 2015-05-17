//
//  HandViewSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/10/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"

#import "BirdsEyeHandLayout.h"
#import "HandView.h"

SPEC_BEGIN(HandViewSpec)
describe(@"HandView", ^{
  let(handView, ^HandView *{
    return FGBuild(HandView.class);
  });

  it(@"is a UICollectionView", ^{
    [[handView should] beKindOfClass:UICollectionView.class];
  });

  describe(@".allowsSelection", ^{
    let(allowsSelection, ^{
      return theValue(handView.allowsSelection);
    });

    it(@"is YES", ^{
      [[allowsSelection should] beYes];
    });
  });

  describe(@".allowsMultipleSelection", ^{
    let(allowsMultipleSelection, ^{
      return theValue(handView.allowsMultipleSelection);
    });

    it(@"is NO", ^{
      [[allowsMultipleSelection should] beNo];
    });
  });

  describe(@".backgroundColor", ^{
    let(backgroundColor, ^{
      return handView.backgroundColor;
    });

    it(@"is clear", ^{
      [[backgroundColor should] equal:UIColor.clearColor];
    });
  });

  describe(@".backgroundView", ^{
    let(backgroundView, ^{
      return handView.backgroundView;
    });

    it(@"is nil", ^{
      [[backgroundView should] beNil];
    });
  });

  describe(@".collectionViewLayout", ^{
    let(collectionViewLayout, ^{
      return handView.collectionViewLayout;
    });

    it(@"is a BirdsEyeHandLayout", ^{
      [[collectionViewLayout should] beKindOfClass:BirdsEyeHandLayout.class];
    });

    it(@"raises an exception when attempting to reassign", ^{
      [[theBlock(^{
        handView.collectionViewLayout = BirdsEyeHandLayout.new;
      }) should] raiseWithName:@"ReassignmentNotPermittedException"
                        reason:@"An attempt to reassign HandView.collectionViewLayout made, its "
                               @"layout should not be set by the user."];
    });
  });

  describe(@".opaque", ^{
    let(opaque, ^{
      return theValue(handView.opaque);
    });

    it(@"is YES", ^{
      [[opaque should] beYes];
    });
  });
});
SPEC_END
