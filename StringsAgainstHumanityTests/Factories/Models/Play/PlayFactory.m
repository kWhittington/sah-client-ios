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
#import "Play.h"
#import "Card.h"

FGFactoryBegin(Play)
[builder field:@"card" assoc:Card.class trait:@"withString"];
FGFactoryEnd
