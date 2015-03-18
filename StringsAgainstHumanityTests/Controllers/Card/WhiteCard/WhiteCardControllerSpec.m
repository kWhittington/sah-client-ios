//
//  WhiteCardControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
@import UIKit;
#import "WhiteCardController.h"
#import "WhiteCard.h"

SPEC_BEGIN(WhiteCardControllerSpec)
describe(@"WhiteCardController", ^{
  let(whiteCard, ^WhiteCard *{
    return FGBuildTrait(WhiteCard.class, @"withString");
  });

  let(whiteCardController, ^WhiteCardController *{
    return [WhiteCardController withWhiteCard:whiteCard];
  });

  describe(@"+ StoryboardID", ^{
    let(result, ^{
      return WhiteCardController.StoryboardID;
    });

    it(@"equals 'WhiteCardController'", ^{
      [[result should] equal:NSStringFromClass(WhiteCardController.class)];
    });
  });

  describe(@"+ withWhiteCard:", ^{
    let(result, ^{
      return [WhiteCardController withWhiteCard:whiteCard];
    });

    specify(^{
      [[result should] beMemberOfClass:WhiteCardController.class];
    });

    it(@"returns a WhiteCardController with a copy of the given WhiteCard", ^{
      [[result.whiteCard should] equal:whiteCard];
    });
  });

  describe(@"- whiteCard", ^{
    let(result, ^{
      return whiteCardController.whiteCard;
    });

    specify(^{
      [[result should] beMemberOfClass:WhiteCard.class];
    });
  });

  describe(@"- label", ^{
    let(result, ^{
      return whiteCardController.label;
    });

    specify(^{
      [[result should] beMemberOfClass:UILabel.class];
    });

    it(@"has - text equal to WhiteCard's string", ^{
      [[result.text should] equal:whiteCardController.whiteCard.string];
    });

    it(@"has - textColor equal to WhiteCard.StringColor", ^{
      [[result.textColor should] equal:WhiteCard.StringColor];
    });
  });

  describe(@"- view", ^{
    let(result, ^{
      return whiteCardController.view;
    });

    it(@"has - backgroundColor equal to WhiteCard.CardColor", ^{
      [[result.backgroundColor should] equal:WhiteCard.CardColor];
    });
  });
});
SPEC_END
