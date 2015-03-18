//
//  HandControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/26/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "HandController.h"
#import "Hand+DataSource.h"
#import "BlackCard.h"
#import "WhiteCard.h"
#import "BirdsEyeHandLayout.h"

SPEC_BEGIN(HandControllerSpec)
describe(@"HandController", ^{
  let(handController, ^HandController *{
    return FGBuildTrait(HandController.class, @"withHand");
  });

  let(hand, ^Hand *{
    return handController.hand;
  });

  let(newWhiteCard, ^WhiteCard *{
    return FGBuildTrait(WhiteCard.class, @"withString");
  });

  describe(@"+ StoryboardID", ^{
    let(result, ^{
      return HandController.StoryboardID;
    });

    it(@"returns NSString of HandController's Storyboard ID", ^{
      [[result should] equal:NSStringFromClass(HandController.class)];
    });
  });

  describe(@"+ empty", ^{
    let(empty, ^{
      return [HandController empty];
    });

    specify(^{
      [[empty should] beMemberOfClass:HandController.class];
    });

    it(@"has an empty Hand", ^{
      [[theValue(empty.hand.isEmpty) should] beYes];
    });
  });

  describe(@"+ withHand:", ^{
    let(withHand, ^{
      return [HandController withHand:hand];
    });

    specify(^{
      [[withHand should] beMemberOfClass:HandController.class];
    });

    it(@"has a copy of the given Hand of WhiteCards", ^{
      [[withHand.hand should] equal:hand];
    });
  });

  describe(@"- addWhiteCard:", ^{
    let(card, ^{
      return newWhiteCard;
    });

    it(@"sends addCard: to its Hand and insertItemsAtIndexPaths: to its CollectionView", ^{
      // NOTE
      // Due to how Kiwi's matchers work, this function will fail if both the dataSource/hand
      // and collectionView are mocked or expecting a message.
      // The collectionView will cause a EXC_BAD_ACCESS error.
      [[handController.hand should] receive:@selector(addCard:) withArguments:card];
      [[handController.collectionView should] receive:@selector(insertItemsAtIndexPaths:)];

      [handController addWhiteCard:card];
    });
  });

  describe(@"- removeWhiteCard:", ^{
    let(card, ^{
      return handController.hand.cards.first;
    });

    it(@"sends removeCard: to its Hand and deleteItemsAtIndexPaths: to its CollectionView", ^{
      // NOTE
      // Due to how Kiwi's matchers work, this function will fail if both the dataSource/hand
      // and collectionView are mocked or expecting a message.
      // The collectionView will cause a EXC_BAD_ACCESS error.
      [[handController.hand should] receive:@selector(removeCard:) withArguments:card];
      [[handController.collectionView should] receive:@selector(deleteItemsAtIndexPaths:)];

      [handController removeWhiteCard:card];
    });
  });

  describe(@"- selectedCards", ^{
    let(selectedCards, ^{
      return handController.selectedCards;
    });

    specify(^{
      [[selectedCards should] beKindOfClass:NSArray.class];
    });

    it(@"returns the Cards located at the CollectionView's - indexPathsForSelectedItems:", ^{
      [[selectedCards should]
        equal:[hand cardsAtIndexPaths:handController.collectionView.indexPathsForSelectedItems]];
    });
  });

#pragma mark <UICollectionViewDelegate>
  describe(@"- collectionView:shouldHighlightItemAtIndexPath:", ^{
    let(collectionView, ^{
      return UICollectionView.nullMock;
    });

    let(indexPath, ^{
      return NSIndexPath.nullMock;
    });

    let(shouldHighlight, ^{
      return theValue(
        [handController collectionView:collectionView shouldHighlightItemAtIndexPath:indexPath]);
    });

    specify(^{
      [[shouldHighlight should] beYes];
    });
  });
  // TODO
  // Specifications for touch input.
});
SPEC_END
