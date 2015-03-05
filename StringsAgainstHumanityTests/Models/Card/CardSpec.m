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
