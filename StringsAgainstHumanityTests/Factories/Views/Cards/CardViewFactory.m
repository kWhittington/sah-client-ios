//
//  CardTextViewFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 4/24/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"
#import "CardView.h"
#import "Card.h"

FGFactoryBegin(CardView)
  [builder initWith:@selector(initWithMainScreenFrameAndCard:) fieldNames:@[@"card"]];

  [builder field:@"card" assoc:[Card class]];
FGFactoryEnd
