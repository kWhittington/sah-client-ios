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

@interface HandController ()

@property(strong) Hand *hand;

@end

@implementation HandController

static NSString *const reuseIdentifier = @"Cell";
static NSString *const cardIdentifier = @"CardCell";

- (void)viewDidLoad {
  [super viewDidLoad];

  // Uncomment the following line to preserve selection between presentations
  // self.clearsSelectionOnViewWillAppear = NO;

  // Register cell classes
  [self.collectionView registerClass:[UICollectionViewCell class]
          forCellWithReuseIdentifier:reuseIdentifier];
  [self initHand];

  // Do any additional setup after loading the view.
}

- (void)initHand {
  self.hand = [Hand testHand];
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
  NSNumber *number = [NSNumber numberWithUnsignedInteger:self.hand.cards.count];
  NSLog(@"%@", number);
  return self.hand.cards.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CardCell *cardCell =
      [collectionView dequeueReusableCellWithReuseIdentifier:cardIdentifier forIndexPath:indexPath];

  // Configure the cell
  Card *card = [self.hand.cards objectAtIndex:indexPath.row];

  [cardCell configureForCard:card];

  return cardCell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath
*)indexPath {
    return YES;
}
*/

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
