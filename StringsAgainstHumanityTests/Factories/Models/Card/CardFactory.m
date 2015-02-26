//
//  CardFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/23/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"
#import "Card.h"

FGFactoryBegin(Card)
  // The default fatory will be equvialent to @"blank" trait.
  [builder initWith:@selector(init) fieldNames:@[]];

  traitDefiners[@"blank"] = ^(FGDefinitionBuilder *blankBuilder) {
    [blankBuilder initWith:@selector(init) fieldNames:@[]];
  };

  traitDefiners[@"withString"] = ^(FGDefinitionBuilder *withStringBuilder) {
    [withStringBuilder field:@"string" value:[GZWords sentence]];
    [withStringBuilder initWith:@selector(initWithString:) fieldNames:@[@"string"]];
  };
FGFactoryEnd
