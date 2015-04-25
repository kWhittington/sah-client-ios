//
//  CardTextViewFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"
#import "CardTextView.h"

FGFactoryBegin(CardTextView)
  [builder initWith:@selector(initWithFrame:textContainer:)
         fieldNames:@[@"frame", @"textContainer"]];

  [builder nilField:@"frame"];
  [builder nilField:@"textContainer"];
FGFactoryEnd
