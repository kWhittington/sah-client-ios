//
//  BlackCardSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import ObjectiveC.runtime;
#import "TestLibraries.pch"
#import "BlackCard.h"
#import "BlackCardView.h"

SPEC_BEGIN(BlackCardViewSpec)
describe(@"BlackCardView", ^{
  let(initFrame, ^NSValue *{
    return [NSValue valueWithCGRect:CGRectZero];
  });

  let(blackCardView, ^BlackCardView *{
    return [[BlackCardView alloc] initWithFrame:initFrame.CGRectValue];
  });

  specify(^{
    [[blackCardView should] beKindOfClass:UIView.class];
  });

  specify(^{
    [[blackCardView should] beMemberOfClass:BlackCardView.class];
  });

  describe(@".backgroundColor", ^{
    let(backgroundColor, ^{
      return blackCardView.backgroundColor;
    });

    specify(^{
      [[backgroundColor should] equal:Constants.BlackColor];
    });
  });

  describe(@".blackCard", ^{
    __block objc_property_t blackCardProperty;

    beforeEach(^{
      blackCardProperty = class_getProperty(BlackCardView.class, "blackCard");
    });

    it(@"is a BlackCard", ^{
      char *type = property_copyAttributeValue(blackCardProperty, "T");
      NSString *typeString = [NSString stringWithUTF8String:type];

      [[typeString should] equal:@"@\"BlackCard\""];

      free(type);
    });

    it(@"is a strong reference", ^{
      char *strongAttribute = property_copyAttributeValue(blackCardProperty, "&");

      [[theValue(strongAttribute) shouldNot] beNil];

      free(strongAttribute);
    });

    it(@"is nonatomic", ^{
      char *nonatomicAttribute = property_copyAttributeValue(blackCardProperty, "N");

      [[theValue(nonatomicAttribute) shouldNot] beNil];

      free(nonatomicAttribute);
    });

    it(@"is readonly", ^{
      char *readonlyAttribute = property_copyAttributeValue(blackCardProperty, "R");

      [[theValue(readonlyAttribute) shouldNot] beNil];

      free(readonlyAttribute);
    });
  });

  describe(@".textLabel", ^{
    __block objc_property_t textLabelProperty;

    let(textLabel, ^{
      return blackCardView.textLabel;
    });

    beforeEach(^{
      textLabelProperty = class_getProperty(BlackCardView.class, "textLabel");
    });

    it(@"is a UILabel", ^{
      char *type = property_copyAttributeValue(textLabelProperty, "T");
      NSString *typeString = [NSString stringWithUTF8String:type];

      [[typeString should] equal:@"@\"UILabel\""];

      free(type);
    });

    it(@"is a strong reference", ^{
      char *strongAttribute = property_copyAttributeValue(textLabelProperty, "&");

      [[theValue(strongAttribute) shouldNot] beNil];

      free(strongAttribute);
    });

    it(@"is nonatomic", ^{
      char *nonatomicAttribute = property_copyAttributeValue(textLabelProperty, "N");

      [[theValue(nonatomicAttribute) shouldNot] beNil];

      free(nonatomicAttribute);
    });

    it(@"is readonly", ^{
      char *readonlyAttribute = property_copyAttributeValue(textLabelProperty, "R");

      [[theValue(readonlyAttribute) shouldNot] beNil];

      free(readonlyAttribute);
    });

    it(@"has Constants.WhiteColor textColor", ^{
      [[textLabel.textColor should] equal:Constants.WhiteColor];
    });
  });
});
SPEC_END
