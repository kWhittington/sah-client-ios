//
//  BlackCardSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/4/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "BlackCard.h"

SPEC_BEGIN(BlackCardSpec)
describe(@"BlackCard", ^{
  let(string, ^NSString *{
    return GZWords.sentence;
  });

  let(blackCard, ^BlackCard *{
    return FGBuildTraitWith(BlackCard.class, @"withString", ^(FGDefinitionBuilder *builder) {
      builder[@"string"] = string;
    });
  });

  it(@"subclasses Card", ^{
    [[blackCard should] beKindOfClass:Card.class];
  });

  describe(@"+ DefaultPickNumber", ^{
    let(result, ^{
      return BlackCard.DefaultPickNumber;
    });

    let(expectedNumber, ^{
      return @1;
    });

    it(@"returns the default - pick value for all BlackCards", ^{
      [[result should] equal:expectedNumber];
    });
  });

  describe(@"+ DefaultDrawNumber", ^{
    let(result, ^{
      return BlackCard.DefaultDrawNumber;
    });

    let(expectedNumber, ^{
      return @0;
    });

    it(@"returns the default - draw value for all BlackCards", ^{
      [[result should] equal:expectedNumber];
    });
  });

  describe(@"- draw", ^{
    let(result, ^{
      return blackCard.draw;
    });

    it(@"returns how many WhiteCards must be drawn by each player (before making plays)", ^{
      [[result should] equal:BlackCard.DefaultDrawNumber];
    });
  });

  describe(@"- pick", ^{
    let(result, ^{
      return blackCard.pick;
    });

    it(@"returns how many WhiteCards must be played by each player", ^{
      [[result should] equal:BlackCard.DefaultPickNumber];
    });
  });
});
SPEC_END
