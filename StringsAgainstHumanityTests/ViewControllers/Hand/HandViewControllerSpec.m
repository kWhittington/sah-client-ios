//
//  HandViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/26/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"

#import "BirdsEyeHandLayout.h"
#import "BlackCard.h"
#import "Card.h"
#import "Hand+DataSource.h"
#import "HandView.h"
#import "HandViewController.h"

SPEC_BEGIN(HandViewControllerSpec)
describe(@"HandViewController", ^{
  let(handViewController, ^HandViewController *{
    return FGBuildTrait(HandViewController.class, @"withHand");
  });

  let(hand, ^Hand *{
    return handViewController.hand;
  });

  let(newCard, ^Card *{
    return FGBuildTrait(Card.class, @"withString");
  });

  describe(@".collectionView", ^{
    let(collectionView, ^{
      return handViewController.collectionView;
    });

    describe(@"is a HandView", ^{
      [[collectionView should] beKindOfClass:HandView.class];
    });

    describe(@".dataSource", ^{
      let(dataSource, ^{
        return (NSObject *)collectionView.dataSource;
      });

      it(@"is a reference to HandViewController.hand", ^{
        [[dataSource should] beIdenticalTo:hand];
      });
    });
  });

  describe(@".hand", ^{
    it(@"is a copy of the Hand managed by HandViewController", ^{
      [[hand should] beMemberOfClass:Hand.class];
    });
  });

  describe(@".selectedCard", ^{
    let(selectedCard, ^{
      return handViewController.selectedCard;
    });

    context(@"when no Card has been selected", ^{
      it(@"is (nil)", ^{
        [[selectedCard should] beNil];
      });
    });

    context(@"when a Card has been selected", ^{
      let(targetCard, ^{
        NSLog(@"HandViewController: %@", handViewController);
        return hand.cards.sample;
      });

      beforeEach(^{
        [handViewController selectCard:targetCard];
      });

      specify(^{
        [[handViewController.selectedCard should] beKindOfClass:Card.class];
      });

      it(@"is that Card", ^{
        [[handViewController.selectedCard should] equal:targetCard];
      });
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
      [[handViewController.hand should] receive:@selector(addCard:) withArguments:card];
      [[handViewController.collectionView should] receive:@selector(insertItemsAtIndexPaths:)];

      [handViewController addCard:card];
    });
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return handViewController.debugDescription;
    });

    it(@"equals HandViewController - description", ^{
      [[debugDescription should] equal:handViewController.description];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return handViewController.description;
    });

    let(expectedString, ^{
      return NSStringWithFormat(@"<HandViewController: %p; hand = %@; selectedCard = %@>",
                                handViewController, hand, handViewController.selectedCard);
    });

    specify(^{
      [[description should] equal:expectedString];
    });
  });

  describe(@"- hasSelectedCard", ^{
    let(hasSelectedCard, ^{
      return theValue(handViewController.hasSelectedCard);
    });

    it(@"equals Hand - selectedCard != nil", ^{
      [[hasSelectedCard should] equal:theValue(NO)];
    });
  });

  describe(@"- playSelectedCard:", ^{
    context(@"when a Card is not selected", ^{
      specify(^{
        [[theBlock(^{
          [handViewController playSelectedCard];
        }) should] raiseWithName:@"NSInternalInconsistencyException"];
      });
    });

    context(@"when a Card is selected", ^{
      beforeEach(^{
        [handViewController selectCard:handViewController.hand.cards.first];
      });

      it(@"calls HandViewController - removeCard: with HandViewController.selectedCard", ^{
        [[handViewController should] receive:@selector(removeCard:)
                               withArguments:handViewController.selectedCard];

        [handViewController playSelectedCard];
      });

      it(@"performs the selected card's play action", ^{
        [[handViewController.selectedCard should] receive:@selector(play)];

        [handViewController playSelectedCard];
      });
    });
  });

  describe(@"- removeCard:", ^{
    let(card, ^{
      return handViewController.hand.cards.first;
    });

    it(@"sends removeCard: to its Hand and deleteItemsAtIndexPaths: to its CollectionView", ^{
      // NOTE
      // Due to how Kiwi's matchers work, this function will fail if both the dataSource/hand
      // and collectionView are mocked or expecting a message.
      // The collectionView will cause a EXC_BAD_ACCESS error.
      [[(NSObject *)handViewController.collectionView.dataSource should]
              receive:@selector(removeCard:)
        withArguments:card];
      [[handViewController.collectionView should] receive:@selector(deleteItemsAtIndexPaths:)];

      [handViewController removeCard:card];
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
      [[handViewController.collectionView should]
              receive:@selector(selectItemAtIndexPath:animated:scrollPosition:)
        withArguments:selectionIndexPath, theValue(NO),
                      theValue(UICollectionViewScrollPositionNone)];

      [handViewController selectCard:cardToSelect];
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
      return theValue([handViewController collectionView:collectionView
                          shouldHighlightItemAtIndexPath:indexPath]);
    });

    specify(^{
      [[shouldHighlight should] beYes];
    });
  });

  describe(@"- swipeUp:", ^{
    let(sender, ^{
      return UISwipeGestureRecognizer.nullMock;
    });

    it(@"calls HandViewController - playSelectedCard", ^{
      [[handViewController should] receive:@selector(playSelectedCard)];

      [handViewController swipeUp:sender];
    });
  });
  // TODO
  // Specifications for touch input.
});
SPEC_END
