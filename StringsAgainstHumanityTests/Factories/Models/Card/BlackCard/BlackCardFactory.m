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
  [builder initFrom:BlackCard.class];
  [builder initWith:@selector(withString:andAction:) fieldNames:@[@"string", @"action"]];

  [builder field:@"string" by:^{
    return GZWords.sentence;
  }];
  builder[@"action"] = ^(Card *card) {
  };

  traitDefiners[@"withString"] = ^(FGDefinitionBuilder *withStringBuilder) {
    [withStringBuilder field:@"string" by:^{
      return GZWords.sentence;
    }];
  };

  traitDefiners[@"withDifferentAction"] = ^(FGDefinitionBuilder *differentAction) {
    differentAction[@"action"] = ^(Card *card) {
      [@"This is just a" isEqualToString:@"Dummy block"];
    };
  };
FGFactoryEnd
