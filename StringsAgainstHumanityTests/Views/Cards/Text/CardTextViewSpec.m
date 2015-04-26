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

  describe(@".selectable", ^{
    let(selectable, ^{
      return theValue(cardTextView.selectable);
    });

    it(@"is NO", ^{
      [[selectable should] beNo];
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

    it(@"is superview", ^{
      [[cardView should] beIdenticalTo:cardTextView.superview];
    });
  });

  describe(@"- willMoveToSuperview:", ^{
    context(@"when the new superview is a kind of CardView", ^{
      let(newSuperview, ^{
        return FGBuild(CardView.class);
      });

      it(@"does nothing", ^{
        [[theBlock(^{
          [cardTextView willMoveToSuperview:newSuperview];
        }) shouldNot] raise];
      });
    });

    context(@"when the new superview is nil", ^{
      it(@"does nothing", ^{
        [[theBlock(^{
          [cardTextView willMoveToSuperview:nil];
        }) shouldNot] raise];
      });
    });

    context(@"when the new superview is not a kind of CardView", ^{
      let(newSuperview, ^{
        return UIView.new;
      });

      let(errorName, ^{
        return @"SuperviewTypeError";
      });

      let(errorReason, ^{
        return
          [NSString stringWithFormat:@"CardTextView.superview must be a kind of CardView, not %@",
                                     newSuperview.class];
      });

      it(@"raises a `SuperviewTypeError`", ^{
        [[theBlock(^{
          [cardTextView willMoveToSuperview:newSuperview];
        }) should] raiseWithName:errorName
                          reason:errorReason];
      });
    });
  });
});
SPEC_END
