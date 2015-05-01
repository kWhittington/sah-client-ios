//
//  WhiteCardViewController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"
#import "WhiteCardViewController.h"
#import "WhiteCard.h"

@interface WhiteCardViewController ()
@property(copy, nonatomic) WhiteCard *whiteCard;

- (void)configureColors;
- (void)configureForWhiteCard:(WhiteCard *)whiteCard;
- (void)configureLabel;
@end

@implementation WhiteCardViewController
+ (instancetype)withWhiteCard:(WhiteCard *)whiteCard {
  WhiteCardViewController *controller = [[self alloc] init];

  [controller loadView];
  [controller configureColors];
  [controller configureForWhiteCard:whiteCard];

  return controller;
}

- (void)configureColors {
  self.label.textColor = WhiteCard.StringColor;
  self.view.backgroundColor = WhiteCard.CardColor;
}

- (void)configureForWhiteCard:(WhiteCard *)whiteCard {
  self.whiteCard = whiteCard;

  [self configureLabel];
}

- (void)configureLabel {
  self.label.text = self.whiteCard.string;
}

- (void)loadView {
  [super loadView];

  self.label = [[UILabel alloc] init];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
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

@end
