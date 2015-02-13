//
//  CardCollectionViewController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/9/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "MainMenuCardCollectionViewController.h"
#import "CardCollectionViewLayout.h"
#import "MainMenuPlayCardViewCell.h"
#import <objc/runtime.h>

// NOTE
//  Declare here, "I want my cells to look like THIS."
//  If it changes anywhere else, call reload data, which triggers the data
//  source to re-draw cells.

@interface MainMenuCardCollectionViewController ()

@property NSArray *cards;

- (void)initializeCards;

@end

@implementation MainMenuCardCollectionViewController

// static NSString *const reuseIdentifier = @"CardCell";
static NSString *const cardCollectionViewCell = @"CardCell";
static NSString *const playCardIdentifier = @"MainMenuPlayCardViewCell";

- (IBAction)tapGesture:(UITapGestureRecognizer *)sender {
}

- (IBAction)unwindToThisController:(UIStoryboardSegue *)unwindSegue {
  
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // Uncomment the following line to preserve selection between presentations
  // self.clearsSelectionOnViewWillAppear = NO;

  // Register cell classes
  //  [self.collectionView registerClass:[CardCollectionViewCell class]
  //          forCellWithReuseIdentifier:reuseIdentifier];

  // Do any additional setup after loading the view.

  [self initializeCards];
}

- (void)initializeCards {
  self.cards = @[ [MainMenuPlayCardViewCell class] ];
}

- (id)copyWithZone:(NSZone *)zone {
  id copy = [[[self class] alloc] init];

  if (copy) {
    [copy setCards:[self.cards copyWithZone:zone]];
  }

  return copy;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before
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

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView
//*)collectionView {
//  return 2;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  //  NSString *identifier = [CardCollectionViewController
  //  cellIdentifiers][@"CardCollectionViewCell"];
  //  NSLog(@"%@",identifier);
  //  UICollectionViewCell *cell =
  //      [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
  //                                                forIndexPath:indexPath];
  //  (void)instrumentObjcMessageSends(YES);
  MainMenuPlayCardViewCell *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:playCardIdentifier
                                                forIndexPath:indexPath];

  if ([cell.gestureRecognizers count] > 0) {
    NSLog(@"Gesture found");
    NSLog(@"%@", cell.gestureRecognizers);
  } else {
    NSLog(@"Gesture NOT found");
  }
  // Configure the cell
  //  cell = [CardCollectionViewCell configureCell:cell for]
  //  cell = [cell configure];
  //  (void)instrumentObjcMessageSends(NO);

  return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted
during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath
*)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for
the specified item,
and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView
shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
  return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView
canPerformAction:(SEL)action
forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
  return NO;
}

- (void)collectionView:(UICollectionView *)collectionView
performAction:(SEL)action
forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {

}
*/

@end
