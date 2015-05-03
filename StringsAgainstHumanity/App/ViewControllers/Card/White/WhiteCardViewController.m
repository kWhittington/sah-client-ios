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
@end

@implementation WhiteCardViewController
+ (instancetype)withWhiteCard:(WhiteCard *)whiteCard {
  return [[self alloc] initWithWhiteCard:whiteCard];
}

- (instancetype)initWithCard:(Card *)card {
  unless([card isKindOfClass:WhiteCard.class]) {
    [NSException
       raise:@"CardTypeException"
      format:@"WhiteCardViewController.card must be assigned a WhiteCard, not %@", card.class];
  }

  return [self initWithWhiteCard:(WhiteCard *)card];
}

#pragma mark Designated Initializer
- (instancetype)initWithWhiteCard:(WhiteCard *)whiteCard {
  self = [super initWithCard:whiteCard];

  [self initProperties];

  return self;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)initProperties {
}

- (void)loadView {
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}
@end
