//
//  WhiteCardTextViewSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "CardTextView.h"
#import "WhiteCardTextView.h"

SPEC_BEGIN(WhiteCardTextViewSpec)
describe(@"WhiteCardTextView", ^{
  let(whiteCardTextView, ^WhiteCardTextView *{
    return FGBuild(WhiteCardTextView.class);
  });

  specify(^{
    [[whiteCardTextView should] beKindOfClass:CardTextView.class];
  });

  describe(@".textColor", ^{
    let(textColor, ^{
      return whiteCardTextView.textColor;
    });

    it(@"is Constants.BlackColor", ^{
      [[textColor should] equal:Constants.BlackColor];
    });
  });
});
SPEC_END
