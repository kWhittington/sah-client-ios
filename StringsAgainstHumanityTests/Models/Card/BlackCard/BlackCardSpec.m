//
//  BlackCardSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/4/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "BlackCard.h"
#import "PlayAction.h"

SPEC_BEGIN(BlackCardSpec)
describe(@"BlackCard", ^{
  let(blackCard, ^BlackCard *{
    return FGBuild(BlackCard.class);
  });

  it(@"subclasses Card", ^{
    [[blackCard should] beKindOfClass:Card.class];
  });

  describe(@"+ CardColor", ^{
    let(cardColor, ^{
      return BlackCard.CardColor;
    });

    it(@"returns Constants.BlackColor", ^{
      [[cardColor should] equal:Constants.BlackColor];
    });
  });

  describe(@"+ DefaultPickNumber", ^{
    let(defaultPickNumber, ^{
      return BlackCard.DefaultPickNumber;
    });

    let(expectedNumber, ^{
      return @1;
    });

    it(@"returns the default - pick value for all BlackCards", ^{
      [[defaultPickNumber should] equal:expectedNumber];
    });
  });

  describe(@"+ DefaultDrawNumber", ^{
    let(defaultDrawNumber, ^{
      return BlackCard.DefaultDrawNumber;
    });

    let(expectedNumber, ^{
      return @0;
    });

    it(@"returns the default - draw value for all BlackCards", ^{
      [[defaultDrawNumber should] equal:expectedNumber];
    });
  });

  describe(@"+ StringColor", ^{
    let(stringColor, ^{
      return BlackCard.StringColor;
    });

    it(@"returns Constants.WhiteColor", ^{
      [[stringColor should] equal:Constants.WhiteColor];
    });
  });

  describe(@"- copy", ^{
    let(copy, ^{
      return blackCard.copy;
    });

    specify(^{
      [[copy should] beMemberOfClass:BlackCard.class];
    });

    it(@"returns an equivalent blackCard", ^{
      [[copy should] equal:blackCard];
    });

    it(@"returns a non-identical blackCard", ^{
      [[copy shouldNot] beIdenticalTo:blackCard];
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
      return NSStringWithFormat(@"<BlackCard: %p; string = %@; playAction = %@>", blackCard,
                                blackCard.string, blackCard.playAction);
    });

    specify(^{
      [[description should] beKindOfClass:NSString.class];
    });

    specify(^{
      [[description should] equal:expectedString];
    });
  });

  describe(@"- draw", ^{
    let(draw, ^{
      return blackCard.draw;
    });

    it(@"returns how many blackCards must be drawn by each player (before making plays)", ^{
      [[draw should] equal:BlackCard.DefaultDrawNumber];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return theValue(nil);
    });

    let(isEqual, ^{
      return theValue([blackCard isEqual:other]);
    });

    context(@"when other is not a BlackCard", ^{
      let(other, ^{
        return GZWords.sentence;
      });

      it(@"returns NO", ^{
        [[isEqual should] beNo];
      });
    });

    context(@"when other is a BlackCard", ^{
      let(other, ^{
        return FGBuild(BlackCard.class);
      });

      context(@"when other is identical to BlackCard", ^{
        let(other, ^{
          return blackCard;
        });

        it(@"returns YES", ^{
          [[isEqual should] beYes];
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
      return FGBuild(BlackCard.class);
    });

    let(isEqualToBlackCard, ^{
      return theValue([blackCard isEqualToBlackCard:other]);
    });

    context(@"when other.string, .playAtion, .draw. and .pick do not equal BlackCard's .string,"
            @".playAction, .draw, and .pick",
            ^{
              let(other, ^{
                return FGBuild(BlackCard.class);
              });

              it(@"returns NO", ^{
                [[isEqualToBlackCard should] beNo];
              });
            });

    context(@"when other.string, .playAction, .draw, and .pick equals BlackCard's .string, "
            @".playAction, .draw, and .pick",
            ^{
              let(other, ^{
                return FGBuildWith(BlackCard.class, @{
                  @"string" : blackCard.string.copy,
                  @"action" : blackCard.playAction.action
                });
              });

              it(@"returns YES", ^{
                [[isEqualToBlackCard should] beYes];
              });
            });
  });

  describe(@"- pick", ^{
    let(pick, ^{
      return blackCard.pick;
    });

    it(@"returns how many blackCards must be played by each player", ^{
      [[pick should] equal:BlackCard.DefaultPickNumber];
    });
  });
});
SPEC_END
