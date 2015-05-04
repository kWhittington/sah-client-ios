//
//  WhiteCardViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "WhiteCard.h"
#import "WhiteCardView.h"
#import "WhiteCardViewController.h"

SPEC_BEGIN(WhiteCardViewControllerSpec)
describe(@"WhiteCardViewController", ^{
  let(whiteCardViewController, ^WhiteCardViewController *{
    return FGBuild(WhiteCardViewController.class);
  });

  it(@"is a kind of card view controller", ^{
    [[whiteCardViewController should] beKindOfClass:CardViewController.class];
  });

  describe(@"- whiteCard", ^{
    let(whiteCard, ^{
      return whiteCardViewController.whiteCard;
    });

    it(@"is the card cast as a white card", ^{
      [[whiteCard should] beIdenticalTo:whiteCardViewController.card];
    });
  });

  describe(@"- isEqualToWhiteCardViewController:", ^{
    let(other, ^{
      return WhiteCardViewController.nullMock;
    });

    let(isEqualToWhiteCardViewController, ^{
      return theValue([whiteCardViewController isEqualToWhiteCardViewController:other]);
    });

    context(@"when both white cards are equal", ^{
      let(other, ^{
        return FGBuildWith(WhiteCardViewController.class, ^(FGDefinitionBuilder *builder) {
          builder[@"whiteCard"] = whiteCardViewController.whiteCard;
        });
      });

      it(@"is YES", ^{
        [[isEqualToWhiteCardViewController should] beYes];
      });
    });

    context(@"when both white cards are not equal", ^{
      let(other, ^{
        return FGBuild(WhiteCardViewController.class);
      });

      it(@"is NO", ^{
        [[isEqualToWhiteCardViewController should] beNo];
      });
    });
  });

  describe(@"- whiteCardView", ^{
    let(whiteCardView, ^{
      return whiteCardViewController.whiteCardView;
    });

    it(@"is the card view cast as a white card view", ^{
      [[whiteCardView should] beIdenticalTo:whiteCardViewController.cardView];
    });
  });
});
SPEC_END
