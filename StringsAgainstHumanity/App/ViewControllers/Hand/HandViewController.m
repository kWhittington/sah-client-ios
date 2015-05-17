//
//  HandViewController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"

#import "BirdsEyeHandLayout.h"
#import "BlackCard.h"
#import "Card.h"
#import "CardViewCell.h"
#import "Hand+DataSource.h"
#import "HandView.h"
#import "HandViewController.h"
#import "ZoomInHandLayout.h"

@interface HandViewController ()
@property(nonatomic) BirdsEyeHandLayout *birdsEyeLayout;
@property(copy, nonatomic) Hand *hand;

- (void)initCollectionView;
- (void)initCollectionViewBackground;
- (void)initCollectionViewDataSource;
@end

@implementation HandViewController
+ (instancetype)empty {
  Hand *hand = [Hand empty];
  HandViewController *controller = [HandViewController withHand:hand];

  return controller;
}

+ (instancetype)withHand:(Hand *)hand {
  HandViewController *controller = [[self alloc] init];

  controller.hand = hand;
  controller.collectionView.dataSource = controller.hand;

  return controller;
}

- (instancetype)init {
  return [self initWithCollectionViewLayout:[BirdsEyeHandLayout new] andHand:[Hand empty]];
}

- (instancetype)initWithHand:(Hand *)hand {
  return [self initWithCollectionViewLayout:[BirdsEyeHandLayout new] andHand:hand];
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
  return [self initWithCollectionViewLayout:layout andHand:Hand.empty];
}

#pragma mark Designated Initializer
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout andHand:(Hand *)hand {
  self = [super initWithCollectionViewLayout:layout];

  if (self) {
    [self initCollectionView];
  }

  return self;
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
  return NSStringWithFormat(@"<HandViewController: %p; hand = %@; selectedCard = %@>", self,
                            self.hand, self.selectedCard);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (UICollectionView *)handView {
  return (HandView *)self.collectionView;
}

- (BOOL)hasSelectedCard {
  return self.selectedCard != nil;
}

- (void)initCollectionView {
  self.collectionView = [HandView withFrame:UIScreen.mainScreen.bounds];
  [self.collectionView registerClass:CardViewCell.class
          forCellWithReuseIdentifier:CardViewCell.reusableID];
  [self initCollectionViewDataSource];
}

- (void)initCollectionViewDataSource {
  self.collectionView.dataSource = self.hand;
}

- (void)playSelectedCard {
  [self.selectedCard play];
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
