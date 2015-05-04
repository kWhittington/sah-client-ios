//
//  BlackCardViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"

#import "BlackCard.h"
#import "BlackCardView.h"
#import "BlackCardViewController.h"

SPEC_BEGIN(BlackCardViewControllerSpec)
describe(@"BlackCardViewController", ^{
  let(blackCardViewController, ^BlackCardViewController *{
    return FGBuild(BlackCardViewController.class);
  });

  it(@"is a kind of card view controller", ^{
    [[blackCardViewController should] beKindOfClass:CardViewController.class];
  });

  describe(@".card", ^{
    let(card, ^{
      return blackCardViewController.card;
    });

    it(@"is a kind of black card", ^{
      [[card should] beKindOfClass:BlackCard.class];
    });
  });

  describe(@"- blackCard", ^{
    let(blackCard, ^{
      return blackCardViewController.blackCard;
    });

    it(@"is the card cast as a black card", ^{
      [[blackCard should] beIdenticalTo:blackCardViewController.card];
    });
  });
});
SPEC_END
