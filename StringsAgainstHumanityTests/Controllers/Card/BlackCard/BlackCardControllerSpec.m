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
#import "BlackCard.h"

SPEC_BEGIN(BlackCardControllerSpec)
describe(@"BlackCardController", ^{
  let(blackCard, ^BlackCard *{
    return FGBuildTrait(BlackCard.class, @"withString");
  });

  let(blackCardController, ^BlackCardController *{
    return [BlackCardController withBlackCard:blackCard];
  });
  
  describe(@"+ StoryboardID", ^{
    let(result, ^{
      return BlackCardController.StoryboardID;
    });
    
    it(@"equals 'BlackCardController'", ^{
      [[result should] equal:NSStringFromClass(BlackCardController.class)];
    });
  });

  describe(@"+ withBlackCard:", ^{
    let(result, ^{
      return [BlackCardController withBlackCard:blackCard];
    });

    specify(^{
      [[result should] beMemberOfClass:BlackCardController.class];
    });

    it(@"returns a BlackCardController with a copy of the given BlackCard", ^{
      [[result.blackCard should] equal:blackCard];
    });
  });

  describe(@"- blackCard", ^{
    let(result, ^{
      return blackCardController.blackCard;
    });

    specify(^{
      [[result should] beMemberOfClass:BlackCard.class];
    });
  });

  describe(@"- label", ^{
    let(result, ^{
      return blackCardController.label;
    });

    specify(^{
      [[result should] beMemberOfClass:UILabel.class];
    });

    it(@"returns a UILabel with - text equal to BlackCard's string", ^{
      [[result.text should] equal:blackCardController.blackCard.string];
    });

    it(@"returns a UILabel with - textColor equal to BlackCard.StringColor", ^{
      [[result.textColor should] equal:BlackCard.StringColor];
    });
  });

  describe(@"- view", ^{
    let(result, ^{
      return blackCardController.view;
    });

    it(@"has - backgroundColor equal to BlackCard.CardColor", ^{
      [[result.backgroundColor should] equal:BlackCard.CardColor];
    });
  });
});
SPEC_END
