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
  [builder initFrom:Card.class];
  [builder initWith:@selector(withString:andAction:) fieldNames:@[@"string", @"action"]];

  [builder field:@"string" by:^{
    return GZWords.sentence;
  }];
  builder[@"action"] = ^(Card *card) {
  };

  traitDefiners[@"withString"] = ^(FGDefinitionBuilder *withStringBuilder) {
    [withStringBuilder initWith:@selector(withString:) fieldNames:@[@"string"]];

    [withStringBuilder field:@"string" by:^{
      return GZWords.sentence;
    }];
  };
FGFactoryEnd
