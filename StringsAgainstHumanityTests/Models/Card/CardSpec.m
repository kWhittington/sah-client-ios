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
  // Each example will inherit a NSString and a Card containing that NSString.
  let(string, ^NSString *{
    return [GZWords sentence];
  });

  let(card, ^Card *{
    return FGBuildTraitWith(Card.class, @"withString", ^(FGDefinitionBuilder *builder) {
      builder[@"string"] = string;
    });
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

  describe(@"+ StringColor", ^{
    let(result, ^{
      return Card.StringColor;
    });

    it(@"returns Constants.BlackColor", ^{
      [[result should] equal:Constants.BlackColor];
    });
  });

  describe(@"+ blank", ^{
    let(result, ^Card *{
      return [Card blank];
    });

    it(@"creates a Card with an empty string", ^{
      [[result.string should] equal:@""];
    });
  });

  describe(@"+ withString:", ^{
    let(result, ^Card *{
      return [Card withString:string];
    });

    it(@"creates a Card with the given string", ^{
      [[result.string should] equal:string];
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

  describe(@"- init", ^{
    let(result, ^Card *{
      return [[Card alloc] init];
    });

    it(@"creates a Card with an empty string", ^{
      [[result.string should] equal:@""];
    });
  });

  describe(@"- initWithString:", ^{
    let(result, ^Card *{
      return [[Card alloc] initWithString:string];
    });

    it(@"creates a Card with the given string", ^{
      [[result.string should] equal:string];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return theValue(nil);
    });

    let(result, ^{
      return theValue([card isEqual:other]);
    });

    context(@"when other is not a Card", ^{
      let(other, ^{
        return GZWords.sentence;
      });

      it(@"returns NO", ^{
        [[result should] beNo];
      });
    });

    context(@"when other is a Card", ^{
      let(other, ^{
        return FGBuildTrait(Card.class, @"withString");
      });

      context(@"when other is identical to Card", ^{
        let(other, ^{
          return card;
        });

        it(@"returns YES", ^{
          [[result should] beYes];
        });
      });

      context(@"when other.string equals Card's string", ^{
        let(other, ^{
          return FGBuildTraitWith(Card.class, @"withString", @{ @"string" : card.string.copy });
        });

        it(@"returns YES", ^{
          [[result should] beYes];
        });
      });

      context(@"when other.string does not equal Card's string", ^{
        it(@"returns NO", ^{
          [[result should] beNo];
        });
      });
    });
  });

  describe(@"- isEqualToCard:", ^{
    let(other, ^{
      return FGBuildTrait(Card.class, @"withString");
    });

    let(result, ^{
      return theValue([card isEqualToCard:other]);
    });

    context(@"when other.string equals Card's string", ^{
      let(other, ^{
        return FGBuildTraitWith(Card.class, @"withString", @{ @"string" : card.string.copy });
      });

      it(@"returns YES", ^{
        [[result should] beYes];
      });
    });

    context(@"when other.string does not equal Card's string", ^{
      let(other, ^{
        return FGBuildTrait(Card.class, @"withString");
      });

      it(@"returns NO", ^{
        [[result should] beNo];
      });
    });
  });

  describe(@"- string", ^{
    let(result, ^NSString *{
      return card.string;
    });

    it(@"returns the Card's NSString", ^{
      [[result should] equal:string];
    });
  });
});
SPEC_END
