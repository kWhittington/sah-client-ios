//
//  HandControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/26/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "HandController.h"
#import "Card.h"

SPEC_BEGIN(HandControllerSpec)
describe(@"HandController", ^{
  let(handController, ^HandController *{
    return [[UIStoryboard storyboardWithName:StoryboardName bundle:nil]
      instantiateViewControllerWithIdentifier:HandController.storyboardID];
  });

  describe(@"+ storyboardID", ^{
    let(result, ^NSString *{
      return HandController.storyboardID;
    });

    it(@"returns NSString of HandController's Storyboard ID", ^{
      [[result should] equal:@"HandController"];
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

  describe(@"- addCard:", ^{
    let(card, ^Card *{
      return FGBuildTrait(Card.class, @"withString");
    });

    it(@"sends addCard: to the DataSource", ^{
      [[(NSObject *)handController.collectionView.dataSource should] receive:@selector(addCard:) withArguments:card];
      [handController addCard:card];
    });
    
    it(@"sends insertItemsAtIndexPaths: to the CollectionView", ^{
      [[(NSObject *)handController.collectionView should] receive:@selector(insertItemsAtIndexPaths:)];
    });
  });

});
SPEC_END
