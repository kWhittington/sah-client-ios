//
//  CardViewController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/1/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "CardViewController.h"

@interface CardViewController ()

@end

@implementation CardViewController
+ (instancetype)withCard:(Card *)card {
  return [[self alloc] initWithCard:card];
}

#pragma mark Designated Initializer
- (instancetype)initWithCard:(Card *)card {
  self = [super init];

  [self initProperties];

  return self;
}

- (void)initProperties {
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

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
