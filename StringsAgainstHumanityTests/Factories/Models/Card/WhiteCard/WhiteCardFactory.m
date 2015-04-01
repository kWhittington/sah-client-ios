//
//  WhiteCardFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/5/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"
#import "WhiteCard.h"

FGFactoryBegin(WhiteCard)
  [builder initFrom:WhiteCard.class];
  [builder initWith:@selector(withString:andAction:) fieldNames:@[@"string", @"action"]];

  [builder field:@"string" by:^{
    return GZWords.sentence;
  }];
  builder[@"action"] = ^(Card *card) {
  };

  traitDefiners[@"blank"] = ^(FGDefinitionBuilder *blankBuilder) {
    [blankBuilder initWith:@selector(init) fieldNames:@[]];
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
