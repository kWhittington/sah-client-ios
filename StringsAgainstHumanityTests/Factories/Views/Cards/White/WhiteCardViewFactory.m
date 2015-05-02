//
//  WhiteCardViewFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"
#import "WhiteCardView.h"
#import "WhiteCard.h"

FGFactoryBegin(WhiteCardView)
  [builder initWith:@selector(initWithMainScreenFrameAndWhiteCard:) fieldNames:@[@"whiteCard"]];

  [builder field:@"whiteCard" assoc:WhiteCard.class];
FGFactoryEnd
