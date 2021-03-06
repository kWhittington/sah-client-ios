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
  let(hand, ^Hand *{
    return FGBuildTrait(Hand.class, @"withCards");
  });

  let(cards, ^NSArray *{
    return hand.cards;
  });

  it(@"conforms the NSCopying protocol", ^{
    [[hand should] conformToProtocol:@protocol(NSCopying)];
  });

  describe(@"+ empty", ^{
    let(result, ^Hand *{
      return [Hand empty];
    });

    it(@"inits a Hand with no Cards", ^{

      [[theValue(result.size) should] beZero];
    });
  });

  describe(@"+ SizeLimit", ^{
    let(result, ^NSNumber *{
      return Hand.SizeLimit;
    });

    it(@"is 10", ^{
      [[result should] equal:@10];
    });
  });

  describe(@"+ withArray:", ^{
    let(withArray, ^{
      return [Hand withArray:cards];
    });

    it(@"inits a Hand with all given cards", ^{
      [[withArray.cards should] containObjectsInArray:cards];
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
    context(@"when index is within Hand's bounds", ^{
      let(index, ^NSNumber *{
        return @(hand.size - 1);
      });

      let(result, ^Card *{
        return [hand cardAtIndex:index.integerValue];
      });

      it(@"returns the Card at that Index", ^{
        [[theValue([hand indexOfCard:result]) should] equal:theValue(index.integerValue)];
      });
    });

    context(@"when index is outside Hand's bounds", ^{
      let(index, ^NSNumber *{
        return [NSNumber numberWithInteger:[hand size]];
      });

      it(@"raises a NSRangeException", ^{
        [[theBlock(^{
          [hand cardAtIndex:index.integerValue];
        }) should] raiseWithName:@"NSRangeException"];
      });
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

  describe(@"- cardsAtIndexes:", ^{
    context(@"when all indexes are within the Hand's bounds", ^{
      let(indexes, ^NSIndexSet *{
        return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, hand.size)];
      });

      it(@"returns the Cards at those indexes", ^{
        [[[hand cardsAtIndexes:indexes] should] containObjectsInArray:cards];
      });
    });

    context(@"when any indexes are outside the Hand's bounds", ^{
      let(indexes, ^NSIndexSet *{
        return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(hand.size, hand.size)];
      });

      it(@"raises a NSRangeException", ^{
        [[theBlock(^{
          [hand cardsAtIndexes:indexes];
        }) should] raiseWithName:@"NSRangeException"];
      });
    });
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return hand.debugDescription;
    });

    specify(^{
      [[debugDescription should] beKindOfClass:NSString.class];
    });

    it(@"returns '<Hand: [memory_address] cards=[hand.cards.description]>", ^{
      NSString *string = NSStringWithFormat(@"<Hand: %p cards=%@>", hand, hand.cards);

      [[debugDescription should] equal:string];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return hand.description;
    });

    specify(^{
      [[description should] beKindOfClass:NSString.class];
    });

    it(@"returns '<Hand: [memory_address] cards=[hand.cards.description]>", ^{
      NSString *string = NSStringWithFormat(@"<Hand: %p cards=%@>", hand, hand.cards);

      [[description should] equal:string];
    });
  });

  describe(@"- init", ^{
    let(init, ^{
      return [[Hand alloc] init];
    });

    specify(^{
      [[init should] beMemberOfClass:Hand.class];
    });

    it(@"has 0 Cards", ^{
      [[init.cards should] beEmpty];
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

  describe(@"- isEqual:", ^{
    let(other, ^{
      return theValue(nil);
    });

    let(isEqual, ^{
      return theValue([hand isEqual:other]);
    });

    context(@"when other is not a Hand", ^{
      let(other, ^{
        return GZWords.sentence;
      });

      it(@"returns NO", ^{
        [[isEqual should] beNo];
      });
    });

    context(@"when other is a Hand", ^{
      context(@"and is identical to Hand", ^{
        let(other, ^{
          return hand;
        });

        it(@"returns YES", ^{
          [[isEqual should] beYes];
        });
      });

      context(@"and has the same Cards as Hand", ^{
        let(other, ^{
          return FGBuildTraitWith(Hand.class, @"withCards", @{ @"cards" : cards.copy });
        });

        it(@"returns YES", ^{
          [[isEqual should] beYes];
        });
      });

      context(@"and doesn't have the same Cards as Hand", ^{
        let(other, ^{
          return FGBuildTrait(Hand.class, @"withCards");
        });

        it(@"returns NO", ^{
          [[isEqual should] beNo];
        });
      });
    });
  });

  describe(@"- isEqualToHand:", ^{
    let(object, ^{
      return NSObject.nullMock;
    });

    let(isEqualToHand, ^{
      return theValue([hand isEqualToHand:object]);
    });

    context(@"when object has the same Cards as Hand", ^{
      let(object, ^Hand *{
        return FGBuildTraitWith(Hand.class, @"withCards", @{ @"cards" : cards.copy });
      });

      it(@"object has cards", ^{
        [[theValue(object.size) should] equal:theValue(cards.count)];
      });

      it(@"returns YES", ^{
        object;
        [[isEqualToHand should] beYes];
      });

    });

    context(@"when other doesn't have the same Cards as Hand", ^{
      let(object, ^{
        return FGBuildTrait(Hand.class, @"withCards");
      });

      it(@"returns NO", ^{
        object;
        [[isEqualToHand should] beNo];
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

  describe(@"- removeAllCards", ^{
    it(@"removes all Cards from the Hand", ^{
      [hand removeAllCards];
      [[theValue(hand.isEmpty) should] beYes];
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

  describe(@"- removeCardsAtIndexes:", ^{
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
