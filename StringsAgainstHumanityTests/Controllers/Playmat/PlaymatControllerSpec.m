//
//  PlaymatControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/19/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "PlaymatController.h"
#import "BlackCardController.h"
#import "HandController.h"
#import "BlackCard.h"
#import "Hand.h"

SPEC_BEGIN(PlaymatControllerSpec)
describe(@"PlaymatController", ^{
  let(playmatController, ^PlaymatController *{
    return FGBuildTrait(PlaymatController.class, @"empty");
  });

  let(blackCardController, ^BlackCardController *{
    return playmatController.blackCardController;
  });

  let(handController, ^HandController *{
    return playmatController.handController;
  });

  it(@"subclasses UIViewController", ^{
    [[playmatController should] beKindOfClass:UIViewController.class];
  });

  describe(@".blackCardController", ^{
    it(@"returns the BlackCardController responsible for the background BlackCard", ^{
      [[blackCardController should] beKindOfClass:BlackCardController.class];
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
        NSUInteger blackCardViewIndex = [subviews indexOfObject:blackCardController.view];
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

  describe(@"+ StartingHand", ^{
    let(startingHand, ^{
      return PlaymatController.StartingHand;
    });

    it(@"is empty", ^{
      [[startingHand should] equal:[Hand empty]];
    });
  });

  describe(@"+ empty", ^{
    let(empty, ^{
      return [PlaymatController empty];
    });

    specify(^{
      [[empty should] beMemberOfClass:PlaymatController.class];
    });

    it(@"has BlackCard equal to PlaymatController + StartingBlackCard", ^{
      [[empty.blackCardController.blackCard should] equal:PlaymatController.StartingBlackCard];
    });

    it(@"has Hand equal to PlaymatController + StartingHand", ^{
      [[empty.handController.hand should] equal:PlaymatController.StartingHand];
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
      return NSStringWithFormat(
        @"<PlaymatController: %p; blackCardController = %@; handController = %@>",
        playmatController, blackCardController, handController);
    });

    it(@"returns '<PlaymatController: [memory_address]' blackCardController=[blackCardController"
        ".description] handController=[handController.description]>",
       ^{
         [[description should] equal:expectedFormat];
       });
  });
});
SPEC_END
