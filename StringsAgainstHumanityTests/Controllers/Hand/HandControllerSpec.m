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

      it(@"is YES", ^{
        [[allowsSelection should] beYes];
      });
    });

    describe(@".allowsMultipleSelection", ^{
      let(allowsMultipleSelection, ^{
        return theValue(collectionView.allowsMultipleSelection);
      });

      it(@"is NO", ^{
        [[allowsMultipleSelection should] beNo];
      });
    });

    describe(@".backgroundColor", ^{
      let(backgroundColor, ^{
        return collectionView.backgroundColor;
      });

      it(@"equals UIColor + clearColor", ^{
        NSLog(@"%@", backgroundColor);
        [[backgroundColor should] equal:[UIColor clearColor]];
      });
    });

    describe(@".backgroundView", ^{
      let(backgroundView, ^{
        return collectionView.backgroundView;
      });

      it(@"is nil", ^{
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

      it(@"is a reference to HandController.hand", ^{
        [[dataSource should] beIdenticalTo:hand];
      });
    });

    describe(@".opaque", ^{
      let(opaque, ^{
        return theValue(collectionView.opaque);
      });

      it(@"is NO", ^{
        [[opaque should] beNo];
      });
    });
  });

  describe(@".hand", ^{
    it(@"is a copy of the Hand managed by HandController", ^{
      [[hand should] beMemberOfClass:Hand.class];
    });
  });

  describe(@".selectedCard", ^{
    let(selectedCard, ^{
      return handController.selectedCard;
    });

    context(@"when no Card has been selected", ^{
      it(@"is (nil)", ^{
        [[selectedCard should] beNil];
      });
    });

    context(@"when a Card has been selected", ^{
      let(targetCard, ^{
        NSLog(@"HandController: %@", handController);
        return hand.cards.sample;
      });

      beforeEach(^{
        [handController selectCard:targetCard];
      });

      specify(^{
        [[handController.selectedCard should] beKindOfClass:Card.class];
      });

      it(@"is that Card", ^{
        [[handController.selectedCard should] equal:targetCard];
      });
    });
  });

  describe(@"+ StoryboardID", ^{
    let(result, ^{
      return HandController.StoryboardID;
    });

    specify(^{
      [[result should] equal:NSStringFromClass(HandController.class)];
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

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return handController.debugDescription;
    });

    it(@"equals HandController - description", ^{
      [[debugDescription should] equal:handController.description];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return handController.description;
    });

    let(expectedString, ^{
      return NSStringWithFormat(@"<HandController: %p; hand = %@; selectedCard = %@>",
                                handController, hand, handController.selectedCard);
    });

    specify(^{
      [[description should] equal:expectedString];
    });
  });

  describe(@"- hasSelectedCard", ^{
    let(hasSelectedCard, ^{
      return theValue(handController.hasSelectedCard);
    });

    it(@"equals Hand - selectedCard != nil", ^{
      [[hasSelectedCard should] equal:theValue(NO)];
    });
  });

  describe(@"- playSelectedCard:", ^{
    context(@"when a Card is not selected", ^{
      specify(^{
        [[theBlock(^{
          [handController playSelectedCard];
        }) should] raiseWithName:@"NSInternalInconsistencyException"];
      });
    });

    context(@"when a Card is selected", ^{
      beforeEach(^{
        [handController selectCard:handController.hand.cards.first];
      });

      it(@"calls HandController - removeCard: with HandController.selectedCard", ^{
        [[handController should] receive:@selector(removeCard:)
                           withArguments:handController.selectedCard];

        [handController playSelectedCard];
      });

      it(@"performs the selected card's play action", ^{
        [[handController.selectedCard should] receive:@selector(play)];

        [handController playSelectedCard];
      });
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
