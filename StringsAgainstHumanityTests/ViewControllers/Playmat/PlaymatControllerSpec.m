//
//  PlaymatViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/19/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "PlaymatViewController.h"
#import "BlackCardViewController.h"
#import "HandViewController.h"
#import "BlackCard.h"
#import "Hand.h"

SPEC_BEGIN(PlaymatViewControllerSpec)
describe(@"PlaymatViewController", ^{
  let(playmatViewController, ^PlaymatViewController *{
    return FGBuildTrait(PlaymatViewController.class, @"empty");
  });

  let(blackCardViewController, ^BlackCardViewController *{
    return playmatViewController.blackCardViewController;
  });

  let(handViewController, ^HandViewController *{
    return playmatViewController.handViewController;
  });

  it(@"subclasses UIViewController", ^{
    [[playmatViewController should] beKindOfClass:UIViewController.class];
  });

  describe(@".blackCardViewController", ^{
    it(@"returns the BlackCardViewController responsible for the background " @"BlackCard", ^{
      [[blackCardViewController should] beKindOfClass:BlackCardViewController.class];
    });
  });

  describe(@".handViewController", ^{
    it(@"returns the HandViewController reponsible for the foreground Hand", ^{
      [[handViewController should] beKindOfClass:HandViewController.class];
    });
  });

  describe(@".view", ^{
    let(view, ^{
      return playmatViewController.view;
    });

    describe(@".subviews", ^{
      let(subviews, ^{
        return view.subviews;
      });

      it(@"displays BlackCard behind Hand", ^{
        NSUInteger blackCardViewIndex = [subviews indexOfObject:blackCardViewController.view];
        NSUInteger handViewIndex = [subviews indexOfObject:handViewController.view];

        [[theValue(blackCardViewIndex) should] beLessThan:theValue(handViewIndex)];
      });
    });
  });

  describe(@"+ StartingBlackCard", ^{
    let(startingBlackCard, ^{
      return PlaymatViewController.StartingBlackCard;
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
      return playmatViewController.debugDescription;
    });

    it(@"equals PlaymatViewController - description", ^{
      [[debugDescription should] equal:playmatViewController.description];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return playmatViewController.description;
    });

    let(expectedFormat, ^{
      return NSStringWithFormat(@"<PlaymatViewController: %p; blackCardViewController "
                                @"= %@; handViewController = %@>",
                                playmatViewController, blackCardViewController, handViewController);
    });

    specify(^{
      [[description should] equal:expectedFormat];
    });
  });

  describe(@"- startingHand", ^{
    let(startingHand, ^{
      return [playmatViewController startingHand];
    });

    it(@"is empty", ^{
      [[theValue(startingHand.isEmpty) should] beYes];
    });
  });
});
SPEC_END
