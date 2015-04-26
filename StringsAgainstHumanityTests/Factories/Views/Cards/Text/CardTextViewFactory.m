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
#import "CardView.h"

FGFactoryBegin(CardTextView)
  [builder initWith:@selector(initWithMainScreenFrameAndCardView:) fieldNames:@[@"cardView"]];

  [builder field:@"cardView" assoc:[CardView class]];
FGFactoryEnd
