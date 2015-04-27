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
#import "CardTextView.h"
#import "Card.h"

SPEC_BEGIN(CardViewSpec)
describe(@"CardView", ^{
  let(cardView, ^CardView *{
    return FGBuild(CardView.class);
  });

  it(@"conforms to the NSCopying protocol", ^{
    [[cardView should] conformToProtocol:@protocol(NSCopying)];
  });

  describe(@".card", ^{
    __block objc_property_t cardProperty;

    beforeEach(^{
      cardProperty = class_getProperty(CardView.class, "card");
    });

    it(@"is a Card", ^{
      NSString *typeString = @(property_copyAttributeValue(cardProperty, "T"));

      [[typeString should] equal:@"@\"Card\""];
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

  describe(@".cardTextView", ^{
    __block objc_property_t cardTextViewProperty;

    let(cardTextView, ^{
      return cardView.cardTextView;
    });

    it(@"has text equal to the card's string", ^{
      [[cardTextView.text should] equal:cardView.card.string];
    });

    beforeEach(^{
      cardTextViewProperty = class_getProperty(CardView.class, "cardTextView");
    });

    it(@"is a CardTextView", ^{
      NSString *typeString = @(property_copyAttributeValue(cardTextViewProperty, "T"));

      [[typeString should] equal:@"@\"CardTextView\""];
    });

    it(@"is a weak reference", ^{
      char *weakAttribute = property_copyAttributeValue(cardTextViewProperty, "W");

      [[theValue(weakAttribute) shouldNot] beNil];

      free(weakAttribute);
    });

    it(@"is nonatmoic", ^{
      char *nonatomicAttribute = property_copyAttributeValue(cardTextViewProperty, "N");

      [[theValue(nonatomicAttribute) shouldNot] beNil];

      free(nonatomicAttribute);
    });

    it(@"is readonly", ^{
      char *readonlyAttribute = property_copyAttributeValue(cardTextViewProperty, "R");

      [[theValue(readonlyAttribute) shouldNot] beNil];

      free(readonlyAttribute);
    });
  });

  describe(@".subviews", ^{
    let(subviews, ^{
      return cardView.subviews;
    });

    it(@"holds the card text view", ^{
      [[subviews should] contain:cardView.cardTextView];
    });
  });

  describe(@"- copy", ^{
    let(copy, ^{
      return cardView.copy;
    });

    it(@"is an equivalent card view", ^{
      [[copy should] equal:cardView];
    });

    it(@"is a non-identical card view", ^{
      [[copy shouldNot] beIdenticalTo:cardView];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return cardView.description;
    });

    let(expectedString, ^{
      return NSStringWithFormat(@"<CardView: %p; card = %@>", cardView, cardView.card);
    });

    specify(^{
      [[description should] equal:expectedString];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return NSObject.nullMock;
    });

    let(isEqual, ^{
      return theValue([cardView isEqual:other]);
    });

    context(@"when other is not a CardView", ^{
      let(other, ^{
        return GZWords.sentence;
      });

      it(@"is NO", ^{
        [[isEqual should] beNo];
      });
    });

    context(@"when other is a CardView", ^{
      context(@"and both card properties are equal", ^{
        let(other, ^{
          return FGBuildWith(CardView.class, ^(FGDefinitionBuilder *builder) {
            builder[@"card"] = cardView.card;
          });
        });

        it(@"is YES", ^{
          [[isEqual should] beYes];
        });
      });

      context(@"and both card properties are not equal", ^{
        let(other, ^{
          return FGBuild(CardView.class);
        });

        it(@"is NO", ^{
          [[isEqual should] beNo];
        });
      });
    });

    context(@"when they are identical", ^{
      let(other, ^{
        return cardView;
      });

      it(@"is YES", ^{
        [[isEqual should] beYes];
      });
    });
  });

  describe(@"- isEqualToCardView:", ^{
    let(other, ^{
      return CardView.nullMock;
    });

    let(isEqualToCardView, ^{
      return theValue([cardView isEqualToCardView:other]);
    });

    context(@"when both card properties are equal", ^{
      let(other, ^{
        return FGBuildWith(CardView.class, ^(FGDefinitionBuilder *builder) {
          builder[@"card"] = cardView.card;
        });
      });

      it(@"is YES", ^{
        [[isEqualToCardView should] beYes];
      });
    });

    context(@"when both card properties are not equal", ^{
      let(other, ^{
        return FGBuild(CardView.class);
      });

      it(@"is NO", ^{
        [[isEqualToCardView should] beNo];
      });
    });
  });
});
SPEC_END
