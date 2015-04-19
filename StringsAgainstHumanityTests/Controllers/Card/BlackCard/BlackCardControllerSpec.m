//
//  BlackCardControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
@import UIKit;
#import "BlackCardController.h"
#import "BlackCardView.h"
#import "BlackCard.h"

SPEC_BEGIN(BlackCardControllerSpec)
describe(@"BlackCardController", ^{
  let(blackCard, ^BlackCard *{
    return FGBuildTrait(BlackCard.class, @"withString");
  });

  let(blackCardController, ^BlackCardController *{
    return [BlackCardController withBlackCard:blackCard];
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return blackCardController.debugDescription;
    });

    it(@"equals BlackCardController - description", ^{
      [[debugDescription should] equal:blackCardController.description];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return blackCardController.description;
    });

    let(expectedString, ^{
      return NSStringWithFormat(@"<BlackCardController: %p; view = %@;>", blackCardController,
                                blackCardController.blackCardView);
    });

    it(@"returns '<BlackCardController: [memory_address]; blackCard = [blackCard.description];"
        " label = [label.description]>'",
       ^{
         blackCardController;
         [[description should] equal:expectedString];
       });
  });

  describe(@"- view", ^{
    let(view, ^{
      return blackCardController.view;
    });

    it(@"is identical to .blackCardView", ^{
      [[view should] beIdenticalTo:blackCardController.blackCardView];
    });
  });
});
SPEC_END
