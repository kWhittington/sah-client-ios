//
//  BlackCardViewController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"
#import "BlackCardViewController.h"
#import "BlackCardView.h"
#import "BlackCard.h"

@interface BlackCardViewController ()
- (instancetype)initWithBlackCard:(BlackCard *)blackCard;
@end

@implementation BlackCardViewController
+ (instancetype)withBlackCard:(BlackCard *)blackCard {
  return [[self alloc] initWithBlackCard:blackCard];
}

- (instancetype)init {
  return [self initWithBlackCard:[BlackCard withString:@"Default string."]];
}

- (instancetype)initWithBlackCard:(BlackCard *)blackCard {
  self = [super init];

  if (self) {
    [self loadView];
  }

  return self;
}

- (BlackCardView *)blackCardView {
  return (BlackCardView *)self.view;
}

- (NSString *)debugDescription {
  return self.description;
}

- (NSString *)description {
  return NSStringWithFormat(@"<BlackCardViewController: %p; view = %@;>", self, self.view);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)loadView {
  self.view = [[BlackCardView alloc] initWithFrame:UIScreen.mainScreen.bounds];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
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
