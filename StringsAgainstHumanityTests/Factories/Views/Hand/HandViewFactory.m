//
//  HandViewFactory.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/10/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//
// clang-format off

#import "FactoryLibraries.pch"

#import "BirdsEyeHandLayout.h"
#import "HandView.h"

FGFactoryBegin(HandView)
  [builder initWith:@selector(initWithMainScreenFrame) fieldNames:@[]];
FGFactoryEnd
