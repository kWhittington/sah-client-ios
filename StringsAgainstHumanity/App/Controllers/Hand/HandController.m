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

@interface HandController ()

@property(strong) Hand *hand;
@property(strong) BirdsEyeHandLayout *birdsEyeLayout;
@property(strong) ZoomInHandLayout *zoomInLayout;
@property(strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer;

@end

@implementation HandController
- (IBAction)handleTap:(UITapGestureRecognizer *)sender {
}

- (IBAction)swipeUp:(UISwipeGestureRecognizer *)sender {
  NSLog(@"Swipe Up");
  NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:0];
  [self.collectionView selectItemAtIndexPath:indexPath
                                    animated:YES
                              scrollPosition:UICollectionViewScrollPositionTop];
  //  [self quickTransitionToLayout:self.zoomInLayout];
}

static NSString *const reuseIdentifier = @"Cell";
static NSString *const cardIdentifier = @"CardCell";

- (void)viewDidLoad {
  [super viewDidLoad];

  // Uncomment the following line to preserve selection between presentations
  //  self.clearsSelectionOnViewWillAppear = NO;

  // Register cell classes
  [self.collectionView registerClass:[UICollectionViewCell class]
          forCellWithReuseIdentifier:reuseIdentifier];
  [self initHand];
  [self initLayouts];

  // Do any additional setup after loading the view.
}

- (void)initHand {
  self.hand = [Hand testHand];
}

- (void)initLayouts {
  self.birdsEyeLayout = [[BirdsEyeHandLayout alloc] init];
  self.zoomInLayout = [[ZoomInHandLayout alloc] init];

  //  self.collectionView.collectionViewLayout = self.zoomInLayout;
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

#pragma mark <UICollectionViewDataSource>

// Apple Doc:
// https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/CollectionViewPGforIOS/CollectionViewPGforIOS.pdf
// If there will only be one section, numberOfSectionsInCollectionView is
// optional.
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//  return 0;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return self.hand.cards.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  return [self collectionView:collectionView cardCellForItemAtIndexPath:indexPath];
}

- (CardCell *)collectionView:(UICollectionView *)collectionView
    cardCellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CardCell *cardCell =
      [collectionView dequeueReusableCellWithReuseIdentifier:cardIdentifier forIndexPath:indexPath];

  // Configure the cell
  Card *card = [self.hand.cards objectAtIndex:indexPath.row];

  [cardCell configureForCard:card];

  return cardCell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  CardCell *cell = [self collectionView:collectionView cardCellForItemAtIndexPath:indexPath];

  NSLog(@"Selected Cell: %@", cell.card.string);

  //  [self swapLayouts];
}

- (void)swapLayouts {
  if ([self usingZoomInLayout]) {
    [self quickTransitionToLayout:self.birdsEyeLayout];
  } else if ([self usingBirdsEyeLayout]) {
    NSLog(@"Start interactive transition");
    //    [self.collectionView
    //        startInteractiveTransitionToCollectionViewLayout:self.zoomInLayout
    //                                              completion:^(BOOL completed, BOOL
    //                                              isFinished){}];
    [self quickTransitionToLayout:self.zoomInLayout];
  }
}

- (void)quickTransitionToLayout:(UICollectionViewFlowLayout *)layout {
  [UIView animateWithDuration:0.35
      delay:0
      options:UIViewAnimationOptionCurveEaseOut
      animations:^{
          // Change flow layout
          [self.collectionView setCollectionViewLayout:layout animated:YES];
      }
      completion:^(BOOL finished){}];
}

- (BOOL)usingZoomInLayout {
  BOOL result = false;

  if ([self.collectionView.collectionViewLayout isMemberOfClass:[ZoomInHandLayout class]]) {
    result = true;
  }

  return result;
}

- (BOOL)usingBirdsEyeLayout {
  BOOL result = false;

  if ([self.collectionView.collectionViewLayout isMemberOfClass:[BirdsEyeHandLayout class]]) {
    result = true;
  }

  return result;
}

// Uncomment this method to specify if the specified item should be highlighted during tracking
static int count = 0;
- (BOOL)collectionView:(UICollectionView *)collectionView
    shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {

  Card *card = [self collectionView:collectionView cardAtIndexPath:indexPath];

  if ((count % 2) == 0) {
    NSLog(@"Should be highlighted, '%@'.", card.string);
    return YES;
  } else {
    NSLog(@"Shouldn't be highlighted, '%@'.", card.string);
    return NO;
  }
}

- (void)collectionView:(UICollectionView *)collectionView
    didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
  //  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
  //  cell.contentView.backgroundColor = [UIColor greenColor];
  NSLog(@"Did Unhighlight");
}

// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView
    shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"Should Select");
  return YES;
}

- (void)collectionView:(UICollectionView *)collectionView
    didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"Did Highlight");
  //  [super collectionView:collectionView didHighlightItemAtIndexPath:indexPath];
  CardCell *cardCell = [self collectionView:collectionView cardCellForItemAtIndexPath:indexPath];
  cardCell.backgroundColor = [UIColor whiteColor];
}

- (void)collectionView:(UICollectionView *)collectionView
    didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
  Card *card = [self collectionView:collectionView cardAtIndexPath:indexPath];

  NSLog(@"Did Deselect, '%@'.", card.string);
}

- (Card *)collectionView:(UICollectionView *)collectionView
         cardAtIndexPath:(NSIndexPath *)indexPath {
  CardCell *cardCell = [self collectionView:collectionView cardCellForItemAtIndexPath:indexPath];
  Card *card = cardCell.card;

  return card;
}

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item,
and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView
shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
  return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action
forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
  return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action
forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {

}
*/

@end
