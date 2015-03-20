//
//  PlaymatController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/19/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "PlaymatController.h"
#import "BlackCardController.h"
#import "HandController.h"
#import "BlackCard.h"
#import "Hand.h"
#import "WhiteCard.h"

@interface PlaymatController ()
@property(strong, nonatomic) BlackCardController *blackCardController;
@property(strong, nonatomic) HandController *handController;

- (void)initBlackCardController;
- (void)initBlackCardControllerView;
- (void)initHandController;
- (void)initHandControllerView;
- (void)initSubControllers;
@end

@implementation PlaymatController
+ (BlackCard *)StartingBlackCard {
  return [BlackCard withString:@"[Please assign a BlackCard]"];
}

+ (NSString *)StoryboardID {
  return NSStringFromClass(self.class);
}

+ (instancetype)empty {
  PlaymatController *controller =
    [Constants.Storyboard instantiateViewControllerWithIdentifier:PlaymatController.StoryboardID];

  return controller;
}

- (void)awakeFromNib {
  [super awakeFromNib];

  [self initSubControllers];
}
- (NSString *)debugDescription {
  return self.description;
}

- (NSString *)description {
  return NSStringWithFormat(
    @"<PlaymatController: %p; blackCardController = %@; handController = %@>", self,
    self.blackCardController, self.handController);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)initBlackCardController {
  self.blackCardController = [BlackCardController withBlackCard:self.class.StartingBlackCard];
  [self addChildViewController:self.blackCardController];
  [self.blackCardController didMoveToParentViewController:self];
}

- (void)initBlackCardControllerView {
  self.blackCardController.view.frame = self.view.frame;
  [self.view addSubview:self.blackCardController.view];
}

- (void)initHandController {
  NSArray *startingCards = @[ [WhiteCard withString:@"Starting Card"] ];
  Hand *startingHand = [Hand withArray:startingCards];
  self.handController = [HandController withHand:startingHand];
  [self addChildViewController:self.handController];
  [self.handController didMoveToParentViewController:self];
}

- (void)initHandControllerView {
  self.handController.view.frame = self.view.frame;
  [self.view addSubview:self.handController.view];
}

- (void)initSubControllers {
  [self initBlackCardController];
  [self initHandController];
}

- (void)initSubControllerViews {
  [self initBlackCardControllerView];
  [self initHandControllerView];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // Do any additional setup after loading the view.
  [self initSubControllerViews];
}
@end
