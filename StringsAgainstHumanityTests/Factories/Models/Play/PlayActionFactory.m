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
[builder field:@"card" assoc:Card.class trait:@"withString"];
builder[@"action"] = ^(Card *card) {};

[builder initFrom:PlayAction.class];
[builder initWith:@selector(withCard:andAction:) fieldNames:@[@"card", @"action"]];
FGFactoryEnd
