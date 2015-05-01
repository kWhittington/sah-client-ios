//
//  PlaymatViewController.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/19/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "PlaymatViewController.h"
#import "BlackCardViewController.h"
#import "HandViewController.h"
#import "BlackCard.h"
#import "Hand.h"
#import "WhiteCard.h"

@interface PlaymatViewController ()
@property(strong, nonatomic) BlackCardViewController *blackCardViewController;
@property(strong, nonatomic) HandViewController *handViewController;

- (void)initBlackCardViewController;
- (void)initBlackCardViewControllerView;
- (void)initHandViewController;
- (void)initHandViewControllerView;
- (void)initSubControllers;
@end

@implementation PlaymatViewController
+ (BlackCard *)StartingBlackCard {
  return [BlackCard withString:@"[Please assign a BlackCard]"];
}

+ (instancetype)empty {
  return [[self alloc] init];
}

- (instancetype)init {
  self = [super init];

  if (self) {
    self.view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self initSubControllers];
    [self initSubControllerViews];
  }

  return self;
}

- (void)awakeFromNib {
  [super awakeFromNib];

  [self initSubControllers];
  [self initSubControllerViews];
}
- (NSString *)debugDescription {
  return self.description;
}

- (NSString *)description {
  return NSStringWithFormat(@"<PlaymatViewController: %p; blackCardViewController "
                            @"= %@; handViewController = %@>",
                            self, self.blackCardViewController, self.handViewController);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)initBlackCardViewController {
  self.blackCardViewController =
    [BlackCardViewController withBlackCard:self.class.StartingBlackCard];
  [self addChildViewController:self.blackCardViewController];
  [self.blackCardViewController didMoveToParentViewController:self];
}

- (void)initBlackCardViewControllerView {
  self.blackCardViewController.view.frame = self.view.frame;
  [self.view addSubview:self.blackCardViewController.view];
}

- (void)initHandViewController {
  self.handViewController = [HandViewController withHand:[self startingHand]];
  [self addChildViewController:self.handViewController];
  [self.handViewController didMoveToParentViewController:self];
}

- (void)initHandViewControllerView {
  self.handViewController.view.frame = self.view.frame;
  [self.view addSubview:self.handViewController.view];
}

- (void)initSubControllers {
  [self initBlackCardViewController];
  [self initHandViewController];
}

- (void)initSubControllerViews {
  [self initBlackCardViewControllerView];
  [self initHandViewControllerView];
}

- (Hand *)startingHand {
  return [Hand empty];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // Do any additional setup after loading the view.
}
@end
