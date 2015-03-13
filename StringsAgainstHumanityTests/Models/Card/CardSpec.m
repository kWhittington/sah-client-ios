//
//  CardSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/18/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "Card.h"

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
