//
//  Hand+DataSourceSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/27/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "Hand+DataSource.h"
#import "Card.h"

SPEC_BEGIN(HandDataSourceSpec)
describe(@"Hand+DataSource", ^{
  // Each example will inherit a NSArray of Cards, a Hand containing those Cards, and a new Card
  // not contained in the Hand.
  let(newCard, ^Card *{
    return FGBuildTrait(Card.class, @"withString");
  });
  
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
  
  it(@"conforms to the UICollectionViewDataSource protocol", ^{
    [[hand should] conformToProtocol:@protocol(UICollectionViewDataSource) ];
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
  
  describe(@"- cardAtIndexPath:", ^{
    context(@"when Hand is not empty", ^{
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
    
    context(@"when Hand is empty", ^{
      let(indexPath, ^NSIndexPath *{
        return [NSIndexPath indexPathForRow:hand.size inSection:0];
      });
      
      let(hand, ^Hand *{
        return FGBuildTrait(Hand.class, @"empty");
      });
      
      it(@"raises a NSRangeException", ^{
        [[theBlock(^{
          [hand cardAtIndexPath:indexPath];
        }) should] raiseWithName:@"NSRangeException"];
      });
    });
  });
});
SPEC_END
