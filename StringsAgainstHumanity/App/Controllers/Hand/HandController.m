//
//  HandController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "PrefixHeader.pch"
#import "HandController.h"
#import "Card.h"
#import "CardCell.h"
#import "ZoomInHandLayout.h"
#import "BirdsEyeHandLayout.h"
#import "Hand+DataSource.h"

@interface HandController ()

@property(strong) BirdsEyeHandLayout *birdsEyeLayout;
@property(weak, readonly) NSArray *selectedCells;
@property(strong) Hand *hand;

@end

@implementation HandController
static NSString *const cardIdentifier = @"CardCell";
static NSString *const storyboardID = @"HandController";

+ (NSString *)storyboardID {
  return storyboardID;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  NSLog(@"THE VIEW LOADED");

  // Uncomment the following line to preserve selection between presentations
  //  self.clearsSelectionOnViewWillAppear = NO;

  // Register cell classes
  [self initLayouts];
  self.hand = [Hand empty];
  self.collectionView.dataSource = self.hand;
  [self.collectionView reloadData];

  // Do any additional setup after loading the view.
}

- (void)initLayouts {
  self.birdsEyeLayout = [[BirdsEyeHandLayout alloc] init];

  self.collectionView.collectionViewLayout = self.birdsEyeLayout;
}

- (void)addCard:(Card *)card {
  [self.collectionView performBatchUpdates:^{
    [self.hand addCard:card];
    NSInteger index = [self.hand indexOfCard:card];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[ indexPath ]];
  } completion:nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)swipeUp:(UISwipeGestureRecognizer *)sender {
  NSLog(@"Swipe Up");

  [self playSelectedCards];
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

- (NSArray *)selectedCards {
  return [self.hand cardsAtIndexPaths:[self.collectionView indexPathsForSelectedItems]];
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView
  didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  Card *card = [self.hand cardAtIndexPath:indexPath];

  NSLog(@"Selected Card: %@", card.string);
}

// Uncomment this method to specify if the specified item should be highlighted during tracking
// static int count = 0;
//- (BOOL)collectionView:(UICollectionView *)collectionView
//    shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//
//  Card *card = [self collectionView:collectionView cardAtIndexPath:indexPath];
//
//  if ((count % 2) == 0) {
//    NSLog(@"Should be highlighted, '%@'.", card.string);
//    return YES;
//  } else {
//    NSLog(@"Shouldn't be highlighted, '%@'.", card.string);
//    return NO;
//  }
//}

//- (void)collectionView:(UICollectionView *)collectionView
//    didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//  //  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
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
//  //  [super collectionView:collectionView didHighlightItemAtIndexPath:indexPath];
//}

- (void)collectionView:(UICollectionView *)collectionView
  didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
  Card *card = [self.hand cardAtIndexPath:indexPath];
  NSLog(@"Did Deselect, '%@'.", card.string);
}

// Uncomment these methods to specify if an action menu should be displayed for the specified item,
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
