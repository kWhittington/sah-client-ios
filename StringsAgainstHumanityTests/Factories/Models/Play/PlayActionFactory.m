//
//  PlayFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off
//
#import "FactoryLibraries.pch"
#import "PlayAction.h"
#import "Card.h"

FGFactoryBegin(PlayAction)
  [builder initFrom:PlayAction.class];
  [builder initWith:@selector(withCard:andAction:) fieldNames:@[@"card", @"action"]];

  builder[@"action"] = ^(Card *card) {};
  // NOTE:
  // The association only works because Card is created with an empty action block.
  // I do not believe the PlayAction created has a reference to the same action block given to the
  // Card in the CardFactory.
  [builder field:@"card" assoc:Card.class];

  traitDefiners[@"withDifferentAction"] = ^(FGDefinitionBuilder *differentAction) {
    differentAction[@"action"] = ^(Card *card) {
      [@"This is just a" isEqualToString:@"Dummy block"];
    };
  };
FGFactoryEnd
