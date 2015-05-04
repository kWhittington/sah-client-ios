//
//  BlackCardViewFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/3/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"

#import "BlackCard.h"
#import "BlackCardView.h"

FGFactoryBegin(BlackCardView)
  [builder initWith:@selector(initWithMainScreenFrameAndBlackCard:) fieldNames:@[@"blackCard"]];

  [builder field:@"blackCard" assoc:BlackCard.class];
FGFactoryEnd
