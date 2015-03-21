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
#import "Card.h"

@interface HandController ()
@property(nonatomic) BirdsEyeHandLayout *birdsEyeLayout;
@property(copy, nonatomic) Hand *hand;

- (void)initBackground;
- (void)initCollectionViewDataSource;
- (void)initLayouts;
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

- (void)addCard:(Card *)card {
  [self.hand addCard:card];
  NSIndexPath *indexPath = [self.hand indexPathOfCard:card];
  [self.collectionView insertItemsAtIndexPaths:@[ indexPath ]];
}

- (NSString *)debugDescription {
  return self.description;
}

- (NSString *)description {
  return NSStringWithFormat(@"<HandController: %p; hand = %@; selectedCard = %@>", self, self.hand,
                            self.selectedCard);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (BOOL)hasSelectedCard {
  return self.selectedCard != nil;
}

- (void)initBackground {
  self.collectionView.backgroundView = nil;
  self.collectionView.backgroundColor = [UIColor clearColor];
  self.collectionView.opaque = NO;
}

- (void)initCollectionViewDataSource {
  self.collectionView.dataSource = self.hand;
}

- (void)initLayouts {
  self.birdsEyeLayout = [[BirdsEyeHandLayout alloc] init];

  self.collectionView.collectionViewLayout = self.birdsEyeLayout;
}

- (void)playSelectedCard {
  [self removeCard:self.selectedCard];
}

- (void)removeCard:(Card *)card {
  NSIndexPath *indexPath = [self.hand indexPathOfCard:card];
  [self.hand removeCard:card];
  [self.collectionView deleteItemsAtIndexPaths:@[ indexPath ]];
}

- (void)selectCard:(Card *)card {
  NSIndexPath *selectionIndexPath = [self.hand indexPathOfCard:card];
  [self.collectionView selectItemAtIndexPath:selectionIndexPath
                                    animated:NO
                              scrollPosition:UICollectionViewScrollPositionNone];
}

- (Card *)selectedCard {
  return [self.hand cardsAtIndexPaths:[self.collectionView indexPathsForSelectedItems]].first;
}

- (IBAction)swipeUp:(UISwipeGestureRecognizer *)sender {
  [self playSelectedCard];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // Uncomment the following line to preserve selection between presentations
  //  self.clearsSelectionOnViewWillAppear = NO;

  // Register cell classes

  // Do any additional setup after loading the view.
  [self initBackground];
  [self initCollectionViewDataSource];
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
