//
//  WhiteCardSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/5/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "WhiteCard.h"
#import "PlayAction.h"

SPEC_BEGIN(WhiteCardSpec)
describe(@"WhiteCard", ^{
  let(string, ^NSString *{
    return GZWords.sentence;
  });

  let(whiteCard, ^WhiteCard *{
    return FGBuildTraitWith(WhiteCard.class, @"withString", ^(FGDefinitionBuilder *builder) {
      builder[@"string"] = string;
    });
  });

  it(@"subclasses Card", ^{
    [[whiteCard should] beKindOfClass:Card.class];
  });

  describe(@"+ CardColor", ^{
    let(result, ^{
      return WhiteCard.CardColor;
    });

    it(@"returns Constants.WhiteColor", ^{
      [[result should] equal:Constants.WhiteColor];
    });
  });

  describe(@"+ StringColor", ^{
    let(result, ^{
      return WhiteCard.StringColor;
    });

    it(@"returns Constants.BlackColor", ^{
      [[result should] equal:Constants.BlackColor];
    });
  });

  describe(@"+ withString:", ^{
    let(result, ^{
      return [WhiteCard withString:string];
    });

    it(@"creates a WhiteCard", ^{
      [[result should] beMemberOfClass:WhiteCard.class];
    });

    it(@"creates a WhiteCard with the given string", ^{
      [[result.string should] equal:string];
    });
  });

  describe(@"- copy", ^{
    let(result, ^{
      return whiteCard.copy;
    });

    specify(^{
      [[result should] beMemberOfClass:WhiteCard.class];
    });

    it(@"is an equivalent WhiteCard", ^{
      [[result should] equal:whiteCard];
    });

    it(@"is a non-identical WhiteCard", ^{
      [[result shouldNot] beIdenticalTo:whiteCard];
    });
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return whiteCard.debugDescription;
    });

    specify(^{
      [[debugDescription should] beKindOfClass:NSString.class];
    });

    it(@"equals WhiteCard - description", ^{
      [[debugDescription should] equal:whiteCard.description];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return whiteCard.description;
    });

    let(expectedString, ^{
      return NSStringWithFormat(@"<WhiteCard: %p; string = %@; playAction = %@>", whiteCard,
                                whiteCard.string, whiteCard.playAction);
    });

    specify(^{
      [[description should] beKindOfClass:NSString.class];
    });

    specify(^{
      [[description should] equal:expectedString];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return WhiteCard.nullMock;
    });

    let(isEqual, ^{
      return theValue([whiteCard isEqual:other]);
    });

    context(@"when other is not a WhiteCard", ^{
      let(other, ^{
        return GZWords.sentence;
      });

      it(@"is NO", ^{
        [[isEqual should] beNo];
      });
    });

    context(@"when other is a WhiteCard", ^{
      let(other, ^{
        return FGBuildTrait(WhiteCard.class, @"withString");
      });

      context(@"when other is identical to WhiteCard", ^{
        let(other, ^{
          return whiteCard;
        });

        it(@"is YES", ^{
          [[isEqual should] beYes];
        });
      });

      context(@"when other.string and .playAction do not equal WhiteCard.string and .playAction", ^{
        it(@"is NO", ^{
          [[isEqual should] beNo];
        });
      });

      context(@"when other.string and .playAction equal WhiteCard.string and .playAction", ^{
        let(other, ^{
          return FGBuildTraitWith(WhiteCard.class, @"withString", @{
            @"string" : whiteCard.string.copy,
            @"action" : whiteCard.playAction.action
          });
        });

        it(@"is YES", ^{
          [[isEqual should] beYes];
        });
      });
    });
  });

  describe(@"- isEqualToWhiteCard:", ^{
    let(other, ^{
      return WhiteCard.nullMock;
    });

    let(isEqualToWhiteCard, ^{
      return theValue([whiteCard isEqualToWhiteCard:other]);
    });

    context(@"when other.string and .playAction do not equal WhiteCard.string and .playAction", ^{
      let(other, ^{
        return FGBuildTrait(WhiteCard.class, @"withDifferentAction");
      });

      it(@"is NO", ^{
        [[isEqualToWhiteCard should] beNo];
      });
    });

    context(@"when other.string and .playAction equal WhiteCard.string and .playAction", ^{
      let(other, ^{
        return FGBuildWith(WhiteCard.class, @{
          @"string" : whiteCard.string.copy,
          @"action" : whiteCard.playAction.action
        });
      });

      it(@"is YES", ^{
        [[isEqualToWhiteCard should] beYes];
      });
    });
  });
});
SPEC_END
