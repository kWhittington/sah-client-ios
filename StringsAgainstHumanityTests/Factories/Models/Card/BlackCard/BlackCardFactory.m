//
//  BlackCardFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/4/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"
#import "BlackCard.h"

FGFactoryBegin(BlackCard)
  // The default factory will be equivalent to @"blank" trait.
  [builder initWith:@selector(init) fieldNames:@[]];

  traitDefiners[@"blank"] = ^(FGDefinitionBuilder *blankBuilder) {
    [blankBuilder initWith:@selector(init) fieldNames:@[]];
  };

  traitDefiners[@"withString"] = ^(FGDefinitionBuilder *withStringBuilder) {
    [withStringBuilder field:@"string" value:[GZWords sentence]];
    [withStringBuilder initWith:@selector(initWithString:) fieldNames:@[@"string"]];
  };
FGFactoryEnd
