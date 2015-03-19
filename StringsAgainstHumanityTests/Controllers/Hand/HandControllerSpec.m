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
#import "Card.h"
#import "BirdsEyeHandLayout.h"

SPEC_BEGIN(HandControllerSpec)
describe(@"HandController", ^{
  let(handController, ^HandController *{
    return FGBuildTrait(HandController.class, @"withHand");
  });

  let(hand, ^Hand *{
    return handController.hand;
  });

  let(newCard, ^Card *{
    return FGBuildTrait(Card.class, @"withString");
  });

  describe(@".collectionView", ^{
    let(collectionView, ^{
      return handController.collectionView;
    });

    describe(@".allowsSelection", ^{
      let(allowsSelection, ^{
        return theValue(collectionView.allowsSelection);
      });

      it(@"returns YES", ^{
        [[allowsSelection should] beYes];
      });
    });

    describe(@".allowsMultipleSelection", ^{
      let(allowsMultipleSelection, ^{
        return theValue(collectionView.allowsMultipleSelection);
      });

      it(@"returns NO", ^{
        [[allowsMultipleSelection should] beNo];
      });
    });

    describe(@".backgroundColor", ^{
      let(backgroundColor, ^{
        return collectionView.backgroundColor;
      });

      it(@"returns UIColor + clearColor", ^{
        NSLog(@"%@", backgroundColor);
        [[backgroundColor should] equal:[UIColor clearColor]];
      });
    });

    describe(@".backgroundView", ^{
      let(backgroundView, ^{
        return collectionView.backgroundView;
      });

      it(@"returns nil", ^{
        [[backgroundView should] beNil];
      });
    });

    describe(@".collectionViewLayout", ^{
      let(collectionViewLayout, ^{
        return (NSObject *)collectionView.collectionViewLayout;
      });
    });

    describe(@".dataSource", ^{
      let(dataSource, ^{
        return (NSObject *)collectionView.dataSource;
      });

      it(@"returns a reference to HandController.hand", ^{
        [[dataSource should] beIdenticalTo:hand];
      });
    });

    describe(@".opaque", ^{
      let(opaque, ^{
        return theValue(collectionView.opaque);
      });

      it(@"returns NO", ^{
        [[opaque should] beNo];
      });
    });
  });

  describe(@".hand", ^{
    it(@"returns a copy of the Hand managed by HandController", ^{
      [[hand should] beMemberOfClass:Hand.class];
    });
  });

  describe(@".selectedCard", ^{
    let(selectedCard, ^{
      return handController.selectedCard;
    });

    specify(^{
      [[selectedCard should] beKindOfClass:NSArray.class];
    });

    it(@"returns the Cards located at the CollectionView's - indexPathsForSelectedItems:", ^{
      [[selectedCard should]
        equal:[hand cardsAtIndexPaths:handController.collectionView.indexPathsForSelectedItems]];
    });
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

    it(@"has a copy of the given Hand of Cards", ^{
      [[withHand.hand should] equal:hand];
    });
  });

  describe(@"- addCard:", ^{
    let(card, ^{
      return newCard;
    });

    it(@"sends addCard: to its Hand and insertItemsAtIndexPaths: to its CollectionView", ^{
      // NOTE
      // Due to how Kiwi's matchers work, this function will fail if both the dataSource/hand
      // and collectionView are mocked or expecting a message.
      // The collectionView will cause a EXC_BAD_ACCESS error.
      [[handController.hand should] receive:@selector(addCard:) withArguments:card];
      [[handController.collectionView should] receive:@selector(insertItemsAtIndexPaths:)];

      [handController addCard:card];
    });
  });

  describe(@"- playSelectedCard:", ^{
    it(@"calls HandController - removeCard: with HandController.selectedCard", ^{
      [[handController should] receive:@selector(removeCard:)
                         withArguments:handController.selectedCard];

      [handController playSelectedCard];
    });
  });

  describe(@"- removeCard:", ^{
    let(card, ^{
      return handController.hand.cards.first;
    });

    it(@"sends removeCard: to its Hand and deleteItemsAtIndexPaths: to its CollectionView", ^{
      // NOTE
      // Due to how Kiwi's matchers work, this function will fail if both the dataSource/hand
      // and collectionView are mocked or expecting a message.
      // The collectionView will cause a EXC_BAD_ACCESS error.
      [[(NSObject *)handController.collectionView.dataSource should] receive:@selector(removeCard:)
                                                               withArguments:card];
      [[handController.collectionView should] receive:@selector(deleteItemsAtIndexPaths:)];

      [handController removeCard:card];
    });
  });

  describe(@"- selectCard:", ^{
    let(cardToSelect, ^{
      return hand.cards.first;
    });

    let(selectionIndexPath, ^{
      return [hand indexPathOfCard:cardToSelect];
    });

    it(@"calls CollectionView's selectItemAtIndexPath:animated:scrollPosition:", ^{
      [[handController.collectionView should]
              receive:@selector(selectItemAtIndexPath:animated:scrollPosition:)
        withArguments:selectionIndexPath, theValue(NO),
                      theValue(UICollectionViewScrollPositionNone)];

      [handController selectCard:cardToSelect];
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

  describe(@"- swipeUp:", ^{
    let(sender, ^{
      return UISwipeGestureRecognizer.nullMock;
    });

    it(@"calls HandController - playSelectedCard", ^{
      [[handController should] receive:@selector(playSelectedCard)];

      [handController swipeUp:sender];
    });
  });
  // TODO
  // Specifications for touch input.
});
SPEC_END
