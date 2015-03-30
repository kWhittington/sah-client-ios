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
  let(blackCard, ^BlackCard *{
    return FGBuild(BlackCard.class);
  });

  it(@"subclasses Card", ^{
    [[blackCard should] beKindOfClass:Card.class];
  });

  describe(@"+ CardColor", ^{
    let(result, ^{
      return BlackCard.CardColor;
    });

    it(@"returns Constants.BlackColor", ^{
      [[result should] equal:Constants.BlackColor];
    });
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

  describe(@"+ StringColor", ^{
    let(result, ^{
      return BlackCard.StringColor;
    });

    it(@"returns Constants.WhiteColor", ^{
      [[result should] equal:Constants.WhiteColor];
    });
  });

  describe(@"- copy", ^{
    let(result, ^{
      return blackCard.copy;
    });

    specify(^{
      [[result should] beMemberOfClass:BlackCard.class];
    });

    it(@"returns an equivalent blackCard", ^{
      [[result should] equal:blackCard];
    });

    it(@"returns a non-identical blackCard", ^{
      [[result shouldNot] beIdenticalTo:blackCard];
    });
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return blackCard.debugDescription;
    });

    specify(^{
      [[debugDescription should] beKindOfClass:NSString.class];
    });

    it(@"returns self.description", ^{
      [[debugDescription should] equal:blackCard.description];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return blackCard.description;
    });

    let(expectedString, ^{
      return NSStringWithFormat(@"<BlackCard: %p; string = %@>", blackCard, blackCard.string);
    });

    specify(^{
      [[description should] beKindOfClass:NSString.class];
    });

    it(@"returns self.description", ^{
      [[description should] equal:expectedString];
    });
  });

  describe(@"- draw", ^{
    let(result, ^{
      return blackCard.draw;
    });

    it(@"returns how many blackCards must be drawn by each player (before making plays)", ^{
      [[result should] equal:BlackCard.DefaultDrawNumber];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return theValue(nil);
    });

    let(result, ^{
      return theValue([blackCard isEqual:other]);
    });

    context(@"when other is not a BlackCard", ^{
      let(other, ^{
        return GZWords.sentence;
      });

      it(@"returns NO", ^{
        [[result should] beNo];
      });
    });

    context(@"when other is a BlackCard", ^{
      let(other, ^{
        return FGBuildTrait(BlackCard.class, @"withString");
      });

      context(@"when other is identical to BlackCard", ^{
        let(other, ^{
          return blackCard;
        });

        it(@"returns YES", ^{
          [[result should] beYes];
        });
      });

      context(@"when other is not identical to BlackCard", ^{
        it(@"calls BlackCard - isEqualToBlackCard:other", ^{
          [[blackCard should] receive:@selector(isEqualToBlackCard:) withArguments:other];

          [blackCard isEqual:other];
        });
      });
    });
  });

  describe(@"- isEqualToBlackCard:", ^{
    let(other, ^{
      return FGBuildTrait(BlackCard.class, @"withString");
    });

    let(result, ^{
      return theValue([blackCard isEqualToBlackCard:other]);
    });

    context(@"when other.string equals BlackCard's string", ^{
      let(other, ^id {
        return FGBuildTraitWith(BlackCard.class, @"withString", @{
          @"string" : blackCard.string.copy
        });
      });

      it(@"returns YES", ^{
        [[result should] beYes];
      });
    });

    context(@"when other.string does not equal BlackCard's string", ^{
      let(other, ^{
        return FGBuildTrait(BlackCard.class, @"withString");
      });

      it(@"returns NO", ^{
        [[result should] beNo];
      });
    });
  });

  describe(@"- pick", ^{
    let(result, ^{
      return blackCard.pick;
    });

    it(@"returns how many blackCards must be played by each player", ^{
      [[result should] equal:BlackCard.DefaultPickNumber];
    });
  });
});
SPEC_END
