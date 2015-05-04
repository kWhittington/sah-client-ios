//
//  BlackCardSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"

#import "BlackCard.h"
#import "BlackCardTextView.h"
#import "BlackCardView.h"

SPEC_BEGIN(BlackCardViewSpec)
describe(@"BlackCardView", ^{
  let(blackCardView, ^BlackCardView *{
    return FGBuild(BlackCardView.class);
  });

  it(@"is a kind of card view", ^{
    [[blackCardView should] beKindOfClass:CardView.class];
  });

  describe(@".backgroundColor", ^{
    let(backgroundColor, ^{
      return blackCardView.backgroundColor;
    });

    it(@"is Constants.BlackColor", ^{
      [[backgroundColor should] equal:Constants.BlackColor];
    });
  });

  describe(@".cardTextView", ^{
    let(cardTextView, ^{
      return blackCardView.cardTextView;
    });

    it(@"is a black card text view", ^{
      [[cardTextView should] beKindOfClass:BlackCardTextView.class];
    });
  });

  describe(@"- blackCardTextView", ^{
    let(blackCardTextView, ^{
      return blackCardView.blackCardTextView;
    });
  });
});
SPEC_END
