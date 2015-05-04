//
//  BlackCardTextViewFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/3/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"

#import "BlackCardView.h"
#import "BlackCardTextView.h"

FGFactoryBegin(BlackCardTextView)
  [builder initWith:@selector(initWithMainScreenFrameAndBlackCardView:)
         fieldNames:@[@"blackCardView"]];

  [builder nilField:@"blackCardView"];
//  [builder field:@"blackCardView" assoc:BlackCardView.class];

//  traitDefiners[@"withoutSuperview"] = ^(FGDefinitionBuilder *withoutSuperview) {
//    [withoutSuperview nilField:@"blackCardView"];
//  };
FGFactoryEnd
