//
//  WhiteCardViewSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "CardView.h"
#import "WhiteCardTextView.h"
#import "WhiteCardView.h"

SPEC_BEGIN(WhiteCardViewSpec)
describe(@"WhiteCardView", ^{
  let(whiteCardView, ^WhiteCardView *{
    return FGBuild(WhiteCardView.class);
  });

  specify(^{
    [[whiteCardView should] beKindOfClass:CardView.class];
  });

  describe(@".backgroundColor", ^{
    let(backgroundColor, ^{
      return whiteCardView.backgroundColor;
    });

    it(@"is Constants.WhiteColor", ^{
      [[backgroundColor should] equal:Constants.WhiteColor];
    });
  });

  describe(@".cardTextView", ^{
    let(cardTextView, ^{
      return whiteCardView.cardTextView;
    });

    it(@"is a WhiteCardTextView", ^{
      [[cardTextView should] beKindOfClass:WhiteCardTextView.class];
    });
  });

  describe(@"- whiteCardTextView", ^{
    let(whiteCardTextView, ^{
      return whiteCardView.whiteCardTextView;
    });

    it(@"is the card text view", ^{
      [[whiteCardTextView should] beIdenticalTo:whiteCardView.cardTextView];
    });
  });
});
SPEC_END
