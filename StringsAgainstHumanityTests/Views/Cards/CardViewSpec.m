//
//  CardViewSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/24/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import ObjectiveC.runtime;
#import "TestLibraries.pch"
#import "CardView.h"
#import "Card.h"

SPEC_BEGIN(CardViewSpec)
describe(@"CardView", ^{
  let(cardView, ^CardView *{
    return FGBuild(CardView.class);
  });

  describe(@".card", ^{
    __block objc_property_t cardProperty;

    beforeEach(^{
      cardProperty = class_getProperty(CardView.class, "card");
    });

    it(@"is a Card", ^{
      char *type = property_copyAttributeValue(cardProperty, "T");
      NSString *typeString = [NSString stringWithUTF8String:type];

      [[typeString should] equal:@"@\"Card\""];

      free(type);
    });

    it(@"is a strong reference", ^{
      char *strongAttribute = property_copyAttributeValue(cardProperty, "&");

      [[theValue(strongAttribute) shouldNot] beNil];

      free(strongAttribute);
    });

    it(@"is nonatomic", ^{
      char *nonatomicAttribute = property_copyAttributeValue(cardProperty, "N");

      [[theValue(nonatomicAttribute) shouldNot] beNil];

      free(nonatomicAttribute);
    });
  });

  describe(@"- isEqualToCardView:", ^{
    let(other, ^{
      return CardView.nullMock;
    });

    let(isEqualToCardView, ^{
      return theValue([cardView isEqualToCardView:other]);
    });

    context(@"when other's card equals this' card", ^{
      let(other, ^{
        return FGBuildWith(CardView.class, ^(FGDefinitionBuilder *builder) {
          builder[@"card"] = cardView.card;
        });
      });

      it(@"is YES", ^{
        [[isEqualToCardView should] beYes];
      });
    });
  });
});
SPEC_END
