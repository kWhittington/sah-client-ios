//
//  Hand+DataSourceSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/27/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "Hand.h"
#import "Hand+DataSource.h"
#import "Card.h"
//
SPEC_BEGIN(HandDataSourceSpec)
describe(@"Hand+DataSource", ^{
  let(hand, ^Hand *{
    return FGBuildTrait(Hand.class, @"withCards");
  });

  let(cards, ^NSArray *{
    return hand.cards;
  });

  let(newCard, ^Card *{
    return FGBuildTrait(Card.class, @"withString");
  });

  it(@"conforms to the UICollectionViewDataSource protocol", ^{
    [[hand should] conformToProtocol:@protocol(UICollectionViewDataSource)];
  });

  describe(@"- cardAtIndexPath:", ^{
    context(@"when indexPath is within Hand's bounds", ^{
      let(indexPath, ^NSIndexPath *{
        return [hand indexPathOfCard:cards.firstObject];
      });

      let(result, ^Card *{
        return [hand cardAtIndexPath:indexPath];
      });

      it(@"returns the Card at the IndexPath", ^{
        [[[hand indexPathOfCard:result] should] equal:indexPath];
      });
    });

    context(@"when indexPath is outside Hand's bounds", ^{
      let(indexPath, ^NSIndexPath *{
        return [NSIndexPath indexPathForRow:hand.size inSection:0];
      });

      it(@"raises a NSRangeException", ^{
        [[theBlock(^{
          [hand cardAtIndexPath:indexPath];
        }) should] raiseWithName:@"NSRangeException"];
      });
    });
  });

  describe(@"- cardsAtIndexPaths:", ^{
    context(@"when all indexPaths are within the Hand's bounds", ^{
      let(indexPaths, ^{
        __block NSMutableArray *indexPaths = [NSMutableArray array];

        [@(hand.size) timesWithIndex:^(NSUInteger index) {
          [indexPaths addObject:[NSIndexPath indexPathForItem:index inSection:0]];
        }];

        return indexPaths;
      });

      it(@"returns the Cards at those IndexPaths", ^{
        [[[hand cardsAtIndexPaths:indexPaths] should] containObjectsInArray:cards];
      });
    });

    context(@"when any indexPaths exceeds the Hand's bounds", ^{
      let(indexPaths, ^{
        __block NSMutableArray *indexPaths = [NSMutableArray array];

        [@(hand.size + 1) timesWithIndex:^(NSUInteger index) {
          [indexPaths addObject:[NSIndexPath indexPathForItem:index inSection:0]];
        }];

        return indexPaths;
      });

      it(@"raises NSRangeException", ^{
        [[theBlock(^{
          [hand cardsAtIndexPaths:indexPaths];
        }) should] raiseWithName:@"NSRangeException"];
      });
    });
  });

  describe(@"- indexPathOfCard:", ^{
    let(card, ^{
      return theValue(nil);
    });

    let(result, ^NSIndexPath *{
      return [hand indexPathOfCard:card];
    });

    context(@"when Hand contains Card", ^{
      let(card, ^Card *{
        return cards.firstObject;
      });

      it(@"returns Card's NSIndexPath", ^{
        [[[hand cardAtIndexPath:result] should] equal:card];
      });
    });

    context(@"when Hand doesn't contain the Card", ^{
      let(card, ^Card *{
        return newCard;
      });

      it(@"returns NSNotFound's NSIndexPath", ^{
        [[theValue(result.row) should] equal:theValue(NSNotFound)];
      });
    });
  });

  describe(@"- removeCardsAtIndexPaths:", ^{
    context(@"when all indexPaths are within the Hand's bounds", ^{
      let(indexPaths, ^{
        __block NSMutableArray *indexPaths = [NSMutableArray array];

        [@(hand.size) timesWithIndex:^(NSUInteger index) {
          [indexPaths addObject:[NSIndexPath indexPathForItem:index inSection:0]];
        }];

        return indexPaths;
      });

      it(@"removes the Cards at those IndexPaths", ^{
        [[theBlock(^{
          [hand removeCardsAtIndexPaths:indexPaths];
        }) should] change:^NSInteger {
          return hand.size;
        }];
      });
    });

    context(@"when any indexPaths exceeds the Hand's bounds", ^{
      let(indexPaths, ^{
        __block NSMutableArray *indexPaths = [NSMutableArray array];

        [@(hand.size + 1) timesWithIndex:^(NSUInteger index) {
          [indexPaths addObject:[NSIndexPath indexPathForItem:index inSection:0]];
        }];

        return indexPaths;
      });

      it(@"raises NSRangeException", ^{
        [[theBlock(^{
          [hand removeCardsAtIndexPaths:indexPaths];
        }) should] raiseWithName:@"NSRangeException"];
      });
    });
  });
});
SPEC_END
