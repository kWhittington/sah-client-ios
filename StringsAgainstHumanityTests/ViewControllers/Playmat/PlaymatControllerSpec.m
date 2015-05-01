//
//  PlaymatControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/19/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "PlaymatController.h"
#import "BlackCardViewController.h"
#import "HandController.h"
#import "BlackCard.h"
#import "Hand.h"

SPEC_BEGIN(PlaymatControllerSpec)
describe(@"PlaymatController", ^{
  let(playmatController, ^PlaymatController *{
    return FGBuildTrait(PlaymatController.class, @"empty");
  });

  let(blackCardViewController, ^BlackCardViewController *{
    return playmatController.blackCardViewController;
  });

  let(handController, ^HandController *{
    return playmatController.handController;
  });

  it(@"subclasses UIViewController", ^{
    [[playmatController should] beKindOfClass:UIViewController.class];
  });

  describe(@".blackCardViewController", ^{
    it(@"returns the BlackCardViewController responsible for the background " @"BlackCard", ^{
      [[blackCardViewController should] beKindOfClass:BlackCardViewController.class];
    });
  });

  describe(@".handController", ^{
    it(@"returns the HandController reponsible for the foreground Hand", ^{
      [[handController should] beKindOfClass:HandController.class];
    });
  });

  describe(@".view", ^{
    let(view, ^{
      return playmatController.view;
    });

    describe(@".subviews", ^{
      let(subviews, ^{
        return view.subviews;
      });

      it(@"displays BlackCard behind Hand", ^{
        NSUInteger blackCardViewIndex = [subviews indexOfObject:blackCardViewController.view];
        NSUInteger handViewIndex = [subviews indexOfObject:handController.view];

        [[theValue(blackCardViewIndex) should] beLessThan:theValue(handViewIndex)];
      });
    });
  });

  describe(@"+ StartingBlackCard", ^{
    let(startingBlackCard, ^{
      return PlaymatController.StartingBlackCard;
    });

    let(expectedString, ^{
      return @"[Please assign a BlackCard]";
    });

    it(@"has string of '[Please assign a BlackCard]'", ^{
      [[startingBlackCard.string should] equal:expectedString];
    });
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return playmatController.debugDescription;
    });

    it(@"equals PlaymatController - description", ^{
      [[debugDescription should] equal:playmatController.description];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return playmatController.description;
    });

    let(expectedFormat, ^{
      return NSStringWithFormat(@"<PlaymatController: %p; blackCardViewController "
                                @"= %@; handController = %@>",
                                playmatController, blackCardViewController, handController);
    });

    specify(^{
      [[description should] equal:expectedFormat];
    });
  });

  describe(@"- startingHand", ^{
    let(startingHand, ^{
      return [playmatController startingHand];
    });

    it(@"is empty", ^{
      [[theValue(startingHand.isEmpty) should] beYes];
    });
  });
});
SPEC_END
