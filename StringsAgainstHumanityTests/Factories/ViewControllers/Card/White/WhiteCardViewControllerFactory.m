//
//  WhiteCardViewControllerFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/3/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"
#import "WhiteCard.h"
#import "WhiteCardViewController.h"

FGFactoryBegin(WhiteCardViewController)
  [builder initWith:@selector(initWithWhiteCard:) fieldNames:@[@"whiteCard"]];

  [builder field:@"whiteCard" assoc:WhiteCard.class];
FGFactoryEnd
