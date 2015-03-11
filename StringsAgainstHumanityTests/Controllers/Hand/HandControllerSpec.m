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
    HandController *result = [[UIStoryboard storyboardWithName:Constants.StoryboardName bundle:nil]
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

    it(@"sends addCard: to its DataSource and interItemsAtIndexPaths to its CollectionView", ^{
      // NOTE
      // Due to how Kiwi's matchers work, this function will fail if both the dataSource/hand
      // and collectionView are mocked or expecting a message.
      // The collectionView will cause a EXC_BAD_ACCESS error.
      [[(NSObject *)handController.collectionView.dataSource should] receive:@selector(addCard:)
                                                               withArguments:card];
      [[(NSObject *)handController.collectionView should]
        receive:@selector(insertItemsAtIndexPaths:)];

      [handController addCard:card];
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
