//
//  CardViewControllerFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/1/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off
//
#import "FactoryLibraries.pch"
#import "CardViewController.h"
#import "Card.h"

FGFactoryBegin(CardViewController)
  [builder initWith:@selector(initWithCard:) fieldNames:@[@"card"]];

  [builder field:@"card" assoc:Card.class];
FGFactoryEnd