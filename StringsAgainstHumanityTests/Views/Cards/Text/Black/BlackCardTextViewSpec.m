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

  describe(@"- blackCardView", ^{
    let(blackCardView, ^{
      return blackCardTextView.blackCardView;
    });

    it(@"is the card view casted as a black card view", ^{
      [[blackCardView should] beIdenticalTo:blackCardTextView.cardView];
    });
  });

  describe(@"- cardView", ^{
    let(cardView, ^{
      return blackCardTextView.cardView;
    });

    it(@"is a black card view", ^{
      [[cardView should] beKindOfClass:BlackCardView.class];
    });
  });

  describe(@"- willMoveToSuperview:", ^{
    context(@"when the new superview is a kind of black card view", ^{
      let(newSuperview, ^{
        return FGBuild(BlackCardView.class);
      });

      it(@"does nothing", ^{
        [[theBlock(^{
          [blackCardTextView willMoveToSuperview:newSuperview];
        }) shouldNot] raise];
      });
    });

    context(@"when the new superview is nil", ^{
      it(@"does nothing", ^{
        [[theBlock(^{
          [blackCardTextView willMoveToSuperview:nil];
        }) shouldNot] raise];
      });
    });

    context(@"when the new superview is not a kind of black card view", ^{
      let(newSuperview, ^{
        return UIView.new;
      });

      let(errorName, ^{
        return @"SuperviewTypeError";
      });

      let(errorReason, ^{
        return [NSString
          stringWithFormat:@"BlackCardTextView.superview must be a kind of BlackCardView, not %@",
                           newSuperview.class];
      });

      it(@"raises a `SuperviewTypeError`", ^{
        [[theBlock(^{
          [blackCardTextView willMoveToSuperview:newSuperview];
        }) should] raiseWithName:errorName
                          reason:errorReason];
      });
    });
  });
});
SPEC_END
