//
//  HandController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "HandController.h"
#import "Hand.h"
#import "Card.h"
#import "CardCell.h"
#import "ZoomInHandLayout.h"
#import "BirdsEyeHandLayout.h"
#import "HandViewDataSource.h"

@interface HandController ()

@property(strong) BirdsEyeHandLayout *birdsEyeLayout;
@property(weak, readonly) NSArray *selectedCells;
@property(strong) HandViewDataSource *handViewDataSource;

@end

@implementation HandController
static NSString *const cardIdentifier = @"CardCell";
static NSString *const storyboardID = @"HandController";

+ (NSString *)storyboardID {
  return storyboardID;
}

- (void)viewDidLoad {
  //  NSLog(@"View Layout %@",self.collectionViewLayout);
  //  NSLog(@"Collection View %@",self.collectionView);
  [super viewDidLoad];

  NSLog(@"THE VIEW LOADED");

  // Uncomment the following line to preserve selection between presentations
  //  self.clearsSelectionOnViewWillAppear = NO;

  // Register cell classes
  [self initLayouts];
  self.handViewDataSource = [[HandViewDataSource alloc] init];
  self.collectionView.dataSource = self.handViewDataSource;

  // Do any additional setup after loading the view.
  //  NSLog(@"View Layout %@",self.collectionViewLayout);
  //  NSLog(@"Collection View %@",self.collectionView);
}

- (void)initLayouts {
  self.birdsEyeLayout = [[BirdsEyeHandLayout alloc] init];

  self.collectionView.collectionViewLayout = self.birdsEyeLayout;
}

- (void)addCard:(Card *)card {
  [self.handViewDataSource addCard:card];
  // There is only one section.
  NSInteger newCardIndex = [self.handViewDataSource collectionView:self.collectionView numberOfItemsInSection:0];
  NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:newCardIndex];
  [self.collectionView insertItemsAtIndexPaths:@[ indexPath ]];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

//- (Hand *)hand {
//  return self.handViewDataSource.hand;
//}

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
  [self.handViewDataSource deleteCardsAtIndexPaths:itemPaths];
  [self.collectionView deleteItemsAtIndexPaths:itemPaths];
  //  } completion:nil];
}

- (NSArray *)selectedCards {
  return
    [self.handViewDataSource cardsAtIndexPaths:[self.collectionView indexPathsForSelectedItems]];
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView
  didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  CardCell *cell =
    [self.handViewDataSource collectionView:collectionView cardCellForItemAtIndexPath:indexPath];

  NSLog(@"Selected Cell: %@", cell.card.string);
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
  Card *card = [self.handViewDataSource cardAtIndexPath:indexPath];
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
