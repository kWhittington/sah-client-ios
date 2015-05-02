//
//  CardViewController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/1/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "Card.h"
#import "CardViewController.h"

@interface CardViewController ()
@property(nonatomic) Card *card;
@end

@implementation CardViewController
+ (instancetype)withCard:(Card *)card {
  return [[self alloc] initWithCard:card];
}

#pragma mark Designated Initializer
- (instancetype)initWithCard:(Card *)card {
  self = [super init];

  [self initPropertiesWithCard:card];

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

- (void)initPropertiesWithCard:(Card *)card {
  self.card = card;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}
@end
