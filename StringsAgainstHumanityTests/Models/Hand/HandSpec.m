//
//  HandSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/23/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "Hand.h"
#import "Card.h"

SPEC_BEGIN(HandSpec)
describe(@"Hand", ^{
  // Each example will inherit a NSArray of Cards and a Hand containing those Cards.
  let(cards, ^NSArray *{
    __block NSArray *cards = @[];

    [@3 times:^{
      cards = [cards arrayByAddingObject:FGBuildTrait(Hand.class, @"withCards")];
    }];

    return cards;
  });

  let(hand, ^Hand *{
    return FGBuildTraitWith(Hand.class, @"withCards", ^(FGDefinitionBuilder *builder) {
      builder[@"cards"] = cards;
    });
  });

  describe(@"+ empty", ^{
    let(result, ^Hand *{
      return [Hand empty];
    });

    it(@"inits a Hand with no Cards", ^{
      [[theValue(result.size) should] beZero];
    });
  });

  describe(@"+ withArray:", ^{
    let(result, ^Hand *{
      return [Hand withArray:cards];
    });

    it(@"inits a Hand with all given cards", ^{
      [[result.cards should] containObjectsInArray:cards];
    });
  });

  describe(@"+ SizeLimit", ^{
    let(result, ^NSNumber *{
      return Hand.SizeLimit;
    });
  });

  describe(@"- cards", ^{
    let(result, ^NSArray *{
      return hand.cards;
    });

    it(@"returns a NSArry containin Hand's Cards", ^{
      [[result should] equal:cards];
    });
  });

  describe(@"- addCard:", ^{
    let(card, ^Card *{
      return FGBuildTrait(Card.class, @"withString");
    });

    it(@"adds the Card to the Hand", ^{
      [[theBlock(^{
        [hand addCard:card];
      }) should] change:^NSInteger {
        return [hand size];
      } by:1];
    });
  });

  describe(@"- cardAtIndex:", ^{
    context(@"when Hand is not empty", ^{
      context(@"when index is within bounds of Hand's size", ^{
        let(index, ^NSNumber *{
          return [NSNumber numberWithInteger:[hand size] - 1];
        });

        specify(^{
          [[theBlock(^{
            [hand cardAtIndex:index.integerValue];
          }) shouldNot] raiseWithName:@"NSRangeException"];
        });
      });

      context(@"when index is out of Hand's size bounds", ^{
        let(index, ^NSNumber *{
          return [NSNumber numberWithInteger:[hand size]];
        });

        specify(^{
          [[theBlock(^{
            [hand cardAtIndex:index.integerValue];
          }) should] raiseWithName:@"NSRangeException"];
        });
      });
    });

    context(@"when Hand is empty", ^{
      let(hand, ^Hand *{
        return FGBuildTrait(Hand.class, @"empty");
      });

      let(index, ^NSNumber *{
        return [NSNumber numberWithUnsignedInteger:0];
      });

      specify(^{
        [[theBlock(^{
          [hand cardAtIndex:index.integerValue];
        }) should] raiseWithName:@"NSRangeException"];
      });
    });
  });

  describe(@"- isEmpty", ^{
    let(result, ^{
      return theValue(hand.isEmpty);
    });

    context(@"when Hand contains Cards", ^{
      specify(^{
        [[result should] beNo];
      });
    });

    context(@"when Hand contains no Cards", ^{
      let(hand, ^{
        return FGBuildTrait(Hand.class, @"empty");
      });

      specify(^{
        [[result should] beYes];
      });
    });
  });

  describe(@"- isFull", ^{
    let(result, ^{
      return theValue(hand.isFull);
    });

    context(@"when Hand size is less than SizeLimit", ^{
      specify(^{
        [[result should] beNo];
      });
    });

    context(@"when Hand size is greater or equal to SizeLimit", ^{
      let(hand, ^{
        __block Hand *hand = FGBuildTrait(Hand.class, @"empty");

        [Hand.SizeLimit times:^{
          [hand addCard:FGBuildTrait(Card.class, @"withString")];
        }];

        return hand;
      });

      specify(^{
        [[result should] beYes];
      });
    });
  });

  describe(@"- removeCard:", ^{
    context(@"when Hand contains the Card", ^{
      let(card, ^Card *{
        return cards.sample;
      });

      it(@"removes the Card", ^{
        [[theBlock(^{
          [hand removeCard:card];
        }) should] change:^NSInteger {
          return hand.size;
        } by:-1];
      });
    });

    context(@"when Hand doesn't contain the Card", ^{
      let(card, ^Card *{
        return FGBuildTrait(Card.class, @"withString");
      });

      it(@"does nothing", ^{
        [[theBlock(^{
          [hand removeCard:card];
        }) should] change:^NSInteger {
          return hand.size;
        } by:0];
      });
    });
  });

  describe(@"- removeCardAtIndex:", ^{
    context(@"when Hand is not empty", ^{
      context(@"when index is within Hand's size bounds", ^{
        let(index, ^NSNumber *{
          return [NSNumber numberWithInteger:hand.size - 1];
        });

        it(@"removes the cards", ^{
          [[theBlock(^{
            [hand removeCardAtIndex:index.integerValue];
          }) should] change:^NSInteger {
            return hand.size;
          } by:-1];
        });
      });

      context(@"when index is out of Hand's size bounds", ^{
        let(index, ^NSNumber *{
          return [NSNumber numberWithInteger:hand.size];
        });

        it(@"raises NSRangeException", ^{
          [[theBlock(^{
            [hand removeCardAtIndex:index.integerValue];
          }) should] raiseWithName:@"NSRangeException"];
        });
      });
    });

    context(@"when Hand is empty", ^{
      it(@"raises NSRangeException", ^{
        [[theBlock(^{
          [hand removeCardAtIndex:arc4random()];
        }) should] raiseWithName:@"NSRangeException"];
      });
    });
  });

  describe(@"- removeCardsAtIndexes:", ^{
    context(@"when Hand is not empty", ^{
      context(@"when indexes are within Hand size bounds", ^{
        let(indexes, ^NSIndexSet *{
          NSLog(@"Hand Size: %ld", hand.size);
          return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, hand.size)];
        });

        it(@"removes the cards", ^{
          [[theBlock(^{
            [hand removeCardsAtIndexes:indexes];
          }) should] change:^NSInteger {
            return hand.size;
          } by:-indexes.count];
        });
      });

      context(@"when indexes are outside Hand size bounds", ^{
        let(indexes, ^NSIndexSet *{
          return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(hand.size, hand.size)];
        });

        it(@"raises NSRangeException", ^{
          [[theBlock(^{
            [hand removeCardsAtIndexes:indexes];
          }) should] raiseWithName:@"NSRangeException"];
        });
      });
    });

    context(@"when Hand is empty", ^{
      let(hand, ^Hand *{
        return FGBuildTrait(Hand.class, @"empty");
      });

      let(indexes, ^NSIndexSet *{
        return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(hand.size, hand.size)];
      });

      it(@"does nothing", ^{
        [[theBlock(^{
          NSLog(@"Hand Index Set: %@", indexes);
          [hand removeCardsAtIndexes:indexes];
        }) should] change:^NSInteger {
          return hand.size;
        } by:0];
      });
    });
  });

  describe(@"- removeCardsInArray:", ^{
    context(@"when Hand contains the Cards", ^{
      it(@"removes the Cards", ^{
        [[theBlock(^{
          [hand removeCardsInArray:cards];
        }) should] change:^NSInteger {
          return -hand.size;
        } by:cards.count];
      });
    });

    context(@"when Hand doesn't contain the Cards", ^{
      let(newCards, ^NSArray *{
        __block NSArray *newCards = @[];

        [@3 times:^{
          newCards = [newCards arrayByAddingObject:FGBuildTrait(Card.class, @"withString")];
        }];

        return newCards;
      });

      it(@"does nothing", ^{
        [[theBlock(^{
          [hand removeCardsInArray:newCards];
        }) should] change:^NSInteger {
          return hand.size;
        } by:0];
      });
    });

    context(@"when Hand is empty", ^{
      let(hand, ^Hand *{
        return FGBuildTrait(Hand.class, @"empty");
      });

      it(@"does nothing", ^{
        [[theBlock(^{
          [hand removeCardsInArray:cards];
        }) should] change:^NSInteger {
          return hand.size;
        } by:0];
      });
    });
  });

  describe(@"- size", ^{
    let(result, ^{
      return theValue(hand.size);
    });

    it(@"returns how many Cards the Hand contains", ^{
      [[result should] equal:theValue(hand.cards.count)];
    });
  });
});
SPEC_END