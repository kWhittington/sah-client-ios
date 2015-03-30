//
//  CardSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/18/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

@import ObjectiveC.runtime;
#import "TestLibraries.pch"
#import "Card.h"
#import "PlayAction.h"

SPEC_BEGIN(CardSpec)
describe(@"Card", ^{
  let(card, ^Card *{
    return FGBuild(Card.class);
  });

  it(@"conforms to the NSCopying protocol", ^{
    [[card should] conformToProtocol:@protocol(NSCopying)];
  });

  describe(@".playAction", ^{
    __block objc_property_t playActionProperty;

    beforeEach(^{
      playActionProperty = class_getProperty(Card.class, "playAction");
    });

    it(@"is a PlayAction", ^{
      char *type = property_copyAttributeValue(playActionProperty, "T");
      NSString *typeString = [NSString stringWithUTF8String:type];

      [[typeString should] equal:@"@\"PlayAction\""];

      free(type);
    });

    it(@"is a strong reference", ^{
      char *strongAttribute = property_copyAttributeValue(playActionProperty, "&");

      [[theValue(strongAttribute) shouldNot] beNil];

      free(strongAttribute);
    });

    it(@"is nonatomic", ^{
      char *nonatomicAttribute = property_copyAttributeValue(playActionProperty, "N");

      [[theValue(nonatomicAttribute) shouldNot] beNil];

      free(nonatomicAttribute);
    });
  });

  describe(@".string", ^{
    __block objc_property_t stringProperty;

    beforeEach(^{
      stringProperty = class_getProperty(Card.class, "string");
    });

    it(@"is a NSString", ^{
      char *type = property_copyAttributeValue(stringProperty, "T");
      NSString *typeString = [NSString stringWithUTF8String:type];

      [[typeString should] equal:@"@\"NSString\""];

      free(type);
    });

    it(@"is a strong reference", ^{
      char *strongAttribute = property_copyAttributeValue(stringProperty, "&");

      [[theValue(strongAttribute) shouldNot] beNil];

      free(strongAttribute);
    });

    it(@"is nonatomic", ^{
      char *nonatomicAttribute = property_copyAttributeValue(stringProperty, "N");

      [[theValue(nonatomicAttribute) shouldNot] beNil];

      free(nonatomicAttribute);
    });
  });

  describe(@"+ CardColor", ^{
    let(result, ^{
      return Card.CardColor;
    });

    it(@"returns Constants.WhiteColor", ^{
      [[result should] equal:Constants.WhiteColor];
    });
  });

  describe(@"+ StringColor", ^{
    let(result, ^{
      return Card.StringColor;
    });

    it(@"returns Constants.BlackColor", ^{
      [[result should] equal:Constants.BlackColor];
    });
  });

  describe(@"- copy", ^{
    let(result, ^{
      return card.copy;
    });

    it(@"returns an equivalent Card", ^{
      [[result should] equal:card];
    });

    it(@"returns a non-identical Card", ^{
      [[result shouldNot] beIdenticalTo:card];
    });
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return card.debugDescription;
    });

    specify(^{
      [[debugDescription should] beKindOfClass:NSString.class];
    });

    it(@"equals Card - description", ^{
      [[debugDescription should] equal:card.description];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return card.description;
    });

    let(expectedString, ^id {
      return NSStringWithFormat(@"<Card: %p; string = %@>", card, card.string);
    });

    specify(^{
      [[description should] beKindOfClass:NSString.class];
    });

    it(@"returns '<Card: [memory_address]; string = [card.string.description]>'", ^{
      [[description should] equal:expectedString];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return theValue(nil);
    });

    let(isEqual, ^{
      return theValue([card isEqual:other]);
    });

    context(@"when other is not a Card", ^{
      let(other, ^{
        return GZWords.sentence;
      });

      it(@"returns NO", ^{
        [[isEqual should] beNo];
      });
    });

    context(@"when other is a Card", ^{
      let(other, ^{
        return FGBuild(Card.class);
      });

      context(@"when other is identical to Card", ^{
        let(other, ^{
          return card;
        });

        it(@"returns YES", ^{
          [[isEqual should] beYes];
        });
      });

      context(@"when other is not identical to Card", ^{
        it(@"calls Card - isEqualToCard:other", ^{
          [[card should] receive:@selector(isEqualToCard:) withArguments:other];

          [card isEqual:other];
        });
      });
    });
  });

  describe(@"- isEqualToCard:", ^{
    let(other, ^{
      return FGBuild(Card.class);
    });

    let(isEqualToCard, ^{
      return theValue([card isEqualToCard:other]);
    });

    context(@"when other.string equals Card's string", ^{
      let(other, ^{
        return FGBuildWith(Card.class, @{ @"string" : card.string.copy });
      });

      it(@"returns YES", ^{
        [[isEqualToCard should] beYes];
      });
    });

    context(@"when other.string does not equal Card's string", ^{
      let(other, ^{
        return FGBuild(Card.class);
      });

      it(@"returns NO", ^{
        [[isEqualToCard should] beNo];
      });
    });
  });
});
SPEC_END
