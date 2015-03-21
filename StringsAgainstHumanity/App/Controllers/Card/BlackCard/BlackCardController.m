//
//  BlackCardController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"
#import "BlackCardController.h"
#import "BlackCard.h"

@interface BlackCardController ()
@property(copy, nonatomic) BlackCard *blackCard;

- (void)configureColors;
- (void)configureForBlackCard:(BlackCard *)blackCard;
- (void)configureLabel;
@end

@implementation BlackCardController
+ (NSString *)StoryboardID {
  return NSStringFromClass(self.class);
}

+ (instancetype)withBlackCard:(BlackCard *)blackCard {
  BlackCardController *controller =
    [Constants.Storyboard instantiateViewControllerWithIdentifier:self.class.StoryboardID];

  [controller loadView];
  [controller configureColors];
  [controller configureForBlackCard:blackCard];

  return controller;
}

- (void)configureColors {
  self.label.textColor = BlackCard.StringColor;
  self.view.backgroundColor = BlackCard.CardColor;
}

- (void)configureForBlackCard:(BlackCard *)blackCard {
  self.blackCard = blackCard;

  [self configureLabel];
}

- (void)configureLabel {
  self.label.text = self.blackCard.string;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
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

@end
