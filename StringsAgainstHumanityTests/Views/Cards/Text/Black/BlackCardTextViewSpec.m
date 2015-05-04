//
//  BlackCardTextViewSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/3/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"

#import "BlackCardTextView.h"
#import "BlackCardView.h"

SPEC_BEGIN(BlackCardTextViewSpec)
describe(@"BlackCardTextView", ^{
  let(blackCardTextView, ^BlackCardTextView *{
    return FGBuild(BlackCardTextView.class);
  });

  it(@"is a kind of card text view", ^{
    [[blackCardTextView should] beKindOfClass:CardTextView.class];
  });

  describe(@".textColor", ^{
    let(textColor, ^{
      return blackCardTextView.textColor;
    });

    it(@"is Constants.WhiteColor", ^{
      [[textColor should] equal:Constants.WhiteColor];
    });
  });
});
SPEC_END
