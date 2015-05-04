//
//  BlackCardViewControllerFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/4/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"

#import "BlackCard.h"
#import "BlackCardViewController.h"

FGFactoryBegin(BlackCardViewController)
  [builder initWith:@selector(initWithBlackCard:) fieldNames:@[@"blackCard"]];

  [builder field:@"blackCard" assoc:BlackCard.class];
FGFactoryEnd
