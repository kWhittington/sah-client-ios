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
  let(cardTextView, ^CardTextView *{
    return FGBuild(CardTextView.class);
  });

  specify(^{
    [[cardTextView should] beKindOfClass:UITextView.class];
  });

  describe(@".backgroundColor", ^{
    let(backgroundColor, ^{
      return cardTextView.backgroundColor;
    });

    specify(^{
      [[backgroundColor should] equal:[UIColor clearColor]];
    });
  });

  describe(@".editable", ^{
    let(editable, ^{
      return theValue(cardTextView.editable);
    });

    it(@"is NO", ^{
      [[editable should] beNo];
    });
  });

  describe(@".font", ^{
    let(font, ^{
      return cardTextView.font;
    });

    specify(^{
      [[font should] equal:[UIFont fontWithName:@"Helvetica-Bold" size:28]];
    });
  });

  describe(@".textAlignment", ^{
    let(textAlignment, ^{
      return theValue(cardTextView.textAlignment);
    });

    it(@"is left aligned", ^{
      [[textAlignment should] equal:theValue(NSTextAlignmentLeft)];
    });
  });

  describe(@"- cardView", ^{
    let(cardView, ^{
      return [cardTextView cardView];
    });

    context(@"when superview is nil", ^{
      let(cardTextView, ^CardTextView *{
        return FGBuildTrait([CardTextView class], @"withoutSuperview");
      });

      it(@"is nil", ^{
        [[cardView should] beNil];
      });
    });

    context(@"when superview is not a CardView", ^{
      let(cardTextView, ^{
        return FGBuildWith([CardTextView class], @{ @"cardView" : [UIView new] });
      });

      it(@"is nil", ^{
        [[cardView should] beNil];
      });
    });

    context(@"when superview is a CardView", ^{
      it(@"is superview", ^{
        [[cardView should] beIdenticalTo:cardTextView.superview];
      });
    });
  });
});
SPEC_END
