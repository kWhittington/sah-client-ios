//
//  HandController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"
#import "HandController.h"
#import "ZoomInHandLayout.h"
#import "BirdsEyeHandLayout.h"
#import "CardViewCell.h"
#import "Hand+DataSource.h"
#import "BlackCard.h"
#import "WhiteCard.h"

@interface HandController ()
@property(nonatomic) BirdsEyeHandLayout *birdsEyeLayout;
@property(copy, nonatomic) Hand *hand;

- (void)initCollectionViewDataSource;
- (void)initLayouts;
- (void)playSelectedCards;
- (void)removeSelectedCards;
@end

@implementation HandController
static NSString *const StoryboardID = @"HandController";

+ (NSString *)StoryboardID {
  return StoryboardID;
}

+ (instancetype)empty {
  Hand *hand = [Hand empty];
  HandController *controller = [HandController withHand:hand];

  return controller;
}

+ (instancetype)withHand:(Hand *)hand {
  HandController *controller =
    [Constants.Storyboard instantiateViewControllerWithIdentifier:HandController.StoryboardID];

  controller.hand = hand;

  return controller;
}

- (void)addWhiteCard:(WhiteCard *)card {
  [self.hand addCard:card];
  NSIndexPath *indexPath = [self.hand indexPathOfCard:card];
  [self.collectionView insertItemsAtIndexPaths:@[ indexPath ]];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)initCollectionViewDataSource {
  self.hand = [Hand withArray:@[
    [Card withString:@"Card #1"],
    [Card withString:@"Card #2"],
    [Card withString:@"Card #3"],
  ]];

  self.collectionView.dataSource = self.hand;
}

- (void)initLayouts {
  self.birdsEyeLayout = [[BirdsEyeHandLayout alloc] init];

  self.collectionView.collectionViewLayout = self.birdsEyeLayout;
}

- (void)playSelectedCards {
  [self.selectedCards each:^(Card *selectedCard) {
    NSLog(@"Play %@", selectedCard.string);
  }];

  [self removeSelectedCards];
}

- (void)removeSelectedCards {
  //  TODO
  //  Figure out if performBatchUpdates:completion: is needed.
  //  [self.collectionView performBatchUpdates:^{
  NSArray *itemPaths = [self.collectionView indexPathsForSelectedItems];
  [self.hand removeCardsAtIndexPaths:itemPaths];
  [self.collectionView deleteItemsAtIndexPaths:itemPaths];
  //  } completion:nil];
}

- (void)removeWhiteCard:(WhiteCard *)card {
  NSIndexPath *indexPath = [self.hand indexPathOfCard:card];
  [self.hand removeCard:card];
  [self.collectionView deleteItemsAtIndexPaths:@[ indexPath ]];
}

- (NSArray *)selectedCards {
  return [self.hand cardsAtIndexPaths:[self.collectionView indexPathsForSelectedItems]];
}

- (IBAction)swipeUp:(UISwipeGestureRecognizer *)sender {
  NSLog(@"Swipe Up");

  [self playSelectedCards];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // Uncomment the following line to preserve selection between presentations
  //  self.clearsSelectionOnViewWillAppear = NO;

  // Register cell classes

  // Do any additional setup after loading the view.
  [self initLayouts];
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView
  didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  Card *card = [self.hand cardAtIndexPath:indexPath];

  NSLog(@"Selected Card: %@", card.string);
}

// Uncomment this method to specify if the specified item should be highlighted
// during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView
  shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {

  return YES;
}

//- (void)collectionView:(UICollectionView *)collectionView
//    didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//  //  UICollectionViewCell *cell = [collectionView
//  cellForItemAtIndexPath:indexPath];
//  //  cell.contentView.backgroundColor = [UIColor greenColor];
//  NSLog(@"Did Unhighlight");
//}

// Uncomment this method to specify if the specified item should be selected
//- (BOOL)collectionView:(UICollectionView *)collectionView
//    shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//  NSLog(@"Should Select");
//}

//- (void)collectionView:(UICollectionView *)collectionView
//    didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//  NSLog(@"Did Highlight");
//  //  [super collectionView:collectionView
//  didHighlightItemAtIndexPath:indexPath];
//}

- (void)collectionView:(UICollectionView *)collectionView
  didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
  Card *card = [self.hand cardAtIndexPath:indexPath];
  NSLog(@"Did Deselect, '%@'.", card.string);
}

// Uncomment these methods to specify if an action menu should be displayed for
// the specified item,
// and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView
  shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
  return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView
      canPerformAction:(SEL)action
    forItemAtIndexPath:(NSIndexPath *)indexPath
            withSender:(id)sender {
  return NO;
}

- (void)collectionView:(UICollectionView *)collectionView
         performAction:(SEL)action
    forItemAtIndexPath:(NSIndexPath *)indexPath
            withSender:(id)sender {
}

@end
