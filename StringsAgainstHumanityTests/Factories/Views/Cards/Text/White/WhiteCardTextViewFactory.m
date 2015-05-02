//
//  WhiteCardTextViewFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"
#import "WhiteCardTextView.h"

FGFactoryBegin(WhiteCardTextView)
//  [builder initWith:@selector(initWithMainScreenFrameAndWhiteCardView:)
//         fieldNames:@[@"whiteCardView"]];
  [builder initWith:@selector(initWithMainScreenFrameAndCardView:) fieldNames:@[@"whiteCardView"]];

  [builder nilField:@"whiteCardView"];
FGFactoryEnd
