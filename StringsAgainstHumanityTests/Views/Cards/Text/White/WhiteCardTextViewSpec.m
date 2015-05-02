//
//  WhiteCardTextViewSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "WhiteCardView.h"
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

  describe(@"- whiteCardView", ^{
    let(whiteCardView, ^{
      return whiteCardTextView.whiteCardView;
    });

    it(@"is the superview", ^{
      [[whiteCardView should] beIdenticalTo:whiteCardTextView.superview];
    });
  });

  describe(@"- willMoveToSuperview:", ^{
    context(@"when the new superview is a kind of WhiteCardView", ^{
      let(newSuperview, ^{
        return FGBuild(WhiteCardView.class);
      });

      it(@"does nothing", ^{
        [[theBlock(^{
          [whiteCardTextView willMoveToSuperview:newSuperview];
        }) shouldNot] raise];
      });
    });

    context(@"when the new superview is nil", ^{
      it(@"does nothing", ^{
        [[theBlock(^{
          [whiteCardTextView willMoveToSuperview:nil];
        }) shouldNot] raise];
      });
    });

    context(@"when the new superview is not a kind of WhiteCardView", ^{
      let(newSuperview, ^{
        return UIView.new;
      });

      let(errorName, ^{
        return @"SuperviewTypeError";
      });

      let(errorReason, ^{
        return [NSString
          stringWithFormat:@"WhiteCardTextView.superview must be a kind of WhiteCardView, not %@",
                           newSuperview.class];
      });

      it(@"raises a `SuperviewTypeError`", ^{
        [[theBlock(^{
          [whiteCardTextView willMoveToSuperview:newSuperview];
        }) should] raiseWithName:errorName
                          reason:errorReason];
      });
    });
  });
});
SPEC_END
