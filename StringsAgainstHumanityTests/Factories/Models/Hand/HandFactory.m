//
//  HandFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/23/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off
//
#import "FactoryLibraries.pch"
#import "Hand.h"
#import "Card.h"

FGFactoryBegin(Hand)
  // The default factory will be equvialent to @"empty" trait.
  [builder initFrom:[Hand class]];
  [builder initWith:@selector(empty) fieldNames:@[]];

  traitDefiners[@"empty"] = ^(FGDefinitionBuilder *emptyBuilder) {
    [emptyBuilder initWith:@selector(empty) fieldNames:@[]];
  };

  traitDefiners[@"withCards"] = ^(FGDefinitionBuilder *withCardsBuilder) {
    [withCardsBuilder field:@"cards" by:^NSArray *{
      return @[
        FGBuildTrait(Card.class, @"withString"),
        FGBuildTrait(Card.class, @"withString"),
        FGBuildTrait(Card.class, @"withString")
      ];
    }];
    
    [builder initFrom:[Hand class]];
    [withCardsBuilder initWith:@selector(withArray:) fieldNames:@[@"cards"]];
  };

FGFactoryEnd
