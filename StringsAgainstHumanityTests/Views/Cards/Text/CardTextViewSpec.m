//
//  CardTextViewSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/20/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import ObjectiveC.runtime;
#import "TestLibraries.pch"
#import "CardTextView.h"
#import "CardView.h"
#import "Card.h"

SPEC_BEGIN(CardTextViewSpec)
describe(@"CardTextView", ^{
  let(cardTextView, ^{
    return FGBuild(CardTextView.class);
  });

  specify(^{
    [[cardTextView should] beKindOfClass:UITextView.class];
  });
});
SPEC_END
