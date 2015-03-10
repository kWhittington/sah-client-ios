//
//  WhiteCardSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/5/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "WhiteCard.h"

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

  describe(@"- initWithString:", ^{
    let(result, ^{
      return [[WhiteCard alloc] initWithString:string];
    });

    specify(^{
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
    
    it(@"returns an equivalent WhiteCard", ^{
      [[result should] equal:whiteCard];
    });

    it(@"returns a non-identical WhiteCard", ^{
      [[result shouldNot] beIdenticalTo:whiteCard];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return theValue(nil);
    });

    let(result, ^{
      return theValue([whiteCard isEqual:other]);
    });

    context(@"when other is not a WhiteCard", ^{
      let(other, ^{
        return GZWords.sentence;
      });

      it(@"returns NO", ^{
        [[result should] beNo];
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

        it(@"returns YES", ^{
          [[result should] beYes];
        });
      });

      context(@"when other.string equals WhiteCard's string", ^{
        let(other, ^{
          return FGBuildTraitWith(WhiteCard.class, @"withString", @{
            @"string" : whiteCard.string.copy
          });
        });

        it(@"returns YES", ^{
          [[result should] beYes];
        });
      });

      context(@"when other.string does not equal WhiteCard's string", ^{
        it(@"returns NO", ^{
          [[result should] beNo];
        });
      });
    });
  });

  describe(@"- isEqualToWhiteCard:", ^{
    let(other, ^{
      return FGBuildTrait(WhiteCard.class, @"withString");
    });

    let(result, ^{
      return theValue([whiteCard isEqualToWhiteCard:other]);
    });

    context(@"when other.string equals WhiteCard's string", ^{
      let(other, ^id {
        return FGBuildTraitWith(WhiteCard.class, @"withString", @{
          @"string" : whiteCard.string.copy
        });
      });

      it(@"returns YES", ^{
        [[result should] beYes];
      });
    });

    context(@"when other.string does not equal WhiteCard's string", ^{
      let(other, ^{
        return FGBuildTrait(WhiteCard.class, @"withString");
      });

      it(@"returns NO", ^{
        [[result should] beNo];
      });
    });
  });
});
SPEC_END
