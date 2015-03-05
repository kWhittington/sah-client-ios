//
//  WhiteCardSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/5/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "WhiteCard.h"

SPEC_BEGIN(WhiteCardSpec)
describe(@"WhiteCard", ^{
  let(string, ^NSString *{
    return GZWords.sentence;
  });

  let(whiteCard, ^id {
    return FGBuildTraitWith(WhiteCard.class, @"withString", ^(FGDefinitionBuilder *builder) {
      builder[@"string"] = string;
    });
  });

  it(@"subclasses Card", ^{
    [[whiteCard should] beKindOfClass:Card.class];
  });
});
SPEC_END
