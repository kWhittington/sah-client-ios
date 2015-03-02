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
#import "Card.h"

SPEC_BEGIN(HandControllerSpec)
describe(@"HandController", ^{
  let(handController, ^HandController *{
    HandController *result = [[UIStoryboard storyboardWithName:StoryboardName bundle:nil]
      instantiateViewControllerWithIdentifier:HandController.storyboardID];
    [result viewDidLoad];
    return result;
  });

  describe(@"+ storyboardID", ^{
    let(result, ^NSString *{
      return HandController.storyboardID;
    });

    it(@"returns NSString of HandController's Storyboard ID", ^{
      [[result should] equal:@"HandController"];
    });
  });

  describe(@"- addCard:", ^{
    let(card, ^Card *{
      return FGBuildTrait(Card.class, @"withString");
    });

    it(@"sends addCard: to its DataSource", ^{
      // NOTE
      // Kiwi's message matchers block the message from actually being run.
      // This will cause the message to throw and error, which is expected below.
      [[(NSObject *)handController.collectionView.dataSource should] receive:@selector(addCard:)
                                                               withArguments:card];
      [[theBlock(^{
        [handController addCard:card];
      }) should] raiseWithName:@"NSInternalInconsistencyException"];
    });

    it(@"sends insertItemsAtIndexPaths: to its CollectionView", ^{
      [[(NSObject *)handController.collectionView should]
        receive:@selector(insertItemsAtIndexPaths:)];
      [[theBlock(^{
        [handController addCard:card];
      }) should] raiseWithName:@"NSInternalInconsistencyException"];
    });

    context(@"when not testing for message passing", ^{
      it(@"raises no error", ^{
        [[theBlock(^{
          [handController addCard:card];
        }) shouldNot] raise];
      });
    });
  });

  describe(@"- blackCard", ^{
    let(result, ^Card *{
      return handController.blackCard;
    });

    it(@"has a string of \"Main Menu\"", ^{
      [[result.string should] equal:@"Main Menu"];
    });
  });

  describe(@"- viewDidLoad", ^{
    it(@"assigns a new BirdsEyeHandLayout to collectionView", ^{
      [[theBlock(^{
        [handController viewDidLoad];
      }) should] change:^NSInteger {
        return handController.collectionView.collectionViewLayout.hash;
      }];
    });

    it(@"assigns a new HandViewDataSource to collectionView", ^{
      [[theBlock(^{
        [handController viewDidLoad];
      }) should] change:^NSInteger {
        return handController.collectionView.dataSource.hash;
      }];
    });
  });

  // TODO
  // Specifications for touch input.
});
SPEC_END
