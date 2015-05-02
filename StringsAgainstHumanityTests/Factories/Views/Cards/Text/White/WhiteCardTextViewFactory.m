//
//  WhiteCardTextViewFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/2/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"
#import "WhiteCardView.h"
#import "WhiteCardTextView.h"

FGFactoryBegin(WhiteCardTextView)
  [builder initWith:@selector(initWithMainScreenFrameAndWhiteCardView:)
         fieldNames:@[@"whiteCardView"]];

  [builder field:@"whiteCardView" assoc:WhiteCardView.class];

  traitDefiners[@"withoutSuperview"] = ^(FGDefinitionBuilder *withoutSuperview) {
    [withoutSuperview nilField:@"whiteCardView"];
  };
FGFactoryEnd
