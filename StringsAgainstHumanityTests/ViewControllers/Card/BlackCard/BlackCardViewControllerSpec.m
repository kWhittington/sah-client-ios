//
//  BlackCardViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
@import UIKit;
#import "BlackCardViewController.h"
#import "BlackCardView.h"
#import "BlackCard.h"

SPEC_BEGIN(BlackCardViewControllerSpec)
describe(@"BlackCardViewController", ^{
  let(blackCard, ^BlackCard *{
    return FGBuildTrait(BlackCard.class, @"withString");
  });

  let(blackCardViewController, ^BlackCardViewController *{
    return [BlackCardViewController withBlackCard:blackCard];
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return blackCardViewController.debugDescription;
    });

    it(@"equals BlackCardViewController - description", ^{
      [[debugDescription should] equal:blackCardViewController.description];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return blackCardViewController.description;
    });

    let(expectedString, ^{
      return NSStringWithFormat(@"<BlackCardViewController: %p; view = %@;>", blackCardViewController,
                                blackCardViewController.blackCardView);
    });

    it(@"returns '<BlackCardViewController: [memory_address]; blackCard = "
       @"[blackCard.description];"
        " label = [label.description]>'",
       ^{
         blackCardViewController;
         [[description should] equal:expectedString];
       });
  });

  describe(@"- view", ^{
    let(view, ^{
      return blackCardViewController.view;
    });

    it(@"is identical to .blackCardView", ^{
      [[view should] beIdenticalTo:blackCardViewController.blackCardView];
    });
  });
});
SPEC_END
