//
//  WhiteCardViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "WhiteCard.h"
#import "WhiteCardViewController.h"

SPEC_BEGIN(WhiteCardViewControllerSpec)
describe(@"WhiteCardViewController", ^{
  let(whiteCardViewController, ^WhiteCardViewController *{
    return FGBuild(WhiteCardViewController.class);
  });

  it(@"is a kind of card view controller", ^{
    [[whiteCardViewController should] beKindOfClass:CardViewController.class];
  });

  describe(@".card", ^{
    let(card, ^{
      return whiteCardViewController.card;
    });

    it(@"is a kind of white card", ^{
      [[card should] beKindOfClass:WhiteCard.class];
    });
  });

  describe(@"- whiteCard", ^{
    let(whiteCard, ^{
      return whiteCardViewController.whiteCard;
    });

    it(@"is the card cast as a white card", ^{
      [[whiteCard should] beIdenticalTo:whiteCardViewController.card];
    });
  });
});
SPEC_END
