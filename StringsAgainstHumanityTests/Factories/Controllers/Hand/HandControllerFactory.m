//
//  HandControllerFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/14/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off
//
#import "FactoryLibraries.pch"
#import "HandController.h"
#import "Hand.h"

FGFactoryBegin(HandController)
  // The default factory will be equivalent to @"empty" trait.
  [builder initFrom:HandController.class];
  [builder initWith:@selector(empty) fieldNames:@[]];

  traitDefiners[@"empty"] = ^(FGDefinitionBuilder *emptyBuilder) {
    [emptyBuilder initWith:@selector(empty) fieldNames:@[]];
  };

  traitDefiners[@"withHand"] = ^(FGDefinitionBuilder *withHandBuilder) {
    [withHandBuilder field:@"hand" assoc:Hand.class trait:@"withCards"];
    [withHandBuilder initWith:@selector(withHand:) fieldNames:@[@"hand"]];
  };
FGFactoryEnd
