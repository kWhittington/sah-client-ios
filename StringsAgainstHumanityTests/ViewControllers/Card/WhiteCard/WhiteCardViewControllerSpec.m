//
//  WhiteCardViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
@import UIKit;
#import "WhiteCardViewController.h"
#import "WhiteCard.h"

SPEC_BEGIN(WhiteCardViewControllerSpec)
describe(@"WhiteCardViewController", ^{
  let(whiteCard, ^WhiteCard *{
    return FGBuildTrait(WhiteCard.class, @"withString");
  });

  let(whiteCardViewController, ^WhiteCardViewController *{
    return [WhiteCardViewController withWhiteCard:whiteCard];
  });

  describe(@"+ withWhiteCard:", ^{
    let(result, ^{
      return [WhiteCardViewController withWhiteCard:whiteCard];
    });

    specify(^{
      [[result should] beMemberOfClass:WhiteCardViewController.class];
    });

    it(@"returns a WhiteCardViewController with a copy of the given WhiteCard", ^{
      [[result.whiteCard should] equal:whiteCard];
    });
  });

  describe(@"- whiteCard", ^{
    let(result, ^{
      return whiteCardViewController.whiteCard;
    });

    specify(^{
      [[result should] beMemberOfClass:WhiteCard.class];
    });
  });

  describe(@"- label", ^{
    let(result, ^{
      return whiteCardViewController.label;
    });

    specify(^{
      [[result should] beMemberOfClass:UILabel.class];
    });

    it(@"has - text equal to WhiteCard's string", ^{
      [[result.text should] equal:whiteCardViewController.whiteCard.string];
    });

    it(@"has - textColor equal to WhiteCard.StringColor", ^{
      [[result.textColor should] equal:WhiteCard.StringColor];
    });
  });

  describe(@"- view", ^{
    let(result, ^{
      return whiteCardViewController.view;
    });

    it(@"has - backgroundColor equal to WhiteCard.CardColor", ^{
      [[result.backgroundColor should] equal:WhiteCard.CardColor];
    });
  });
});
SPEC_END
