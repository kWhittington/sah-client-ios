//
//  WhiteCardViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "WhiteCard.h"
#import "WhiteCardViewController.h"

SPEC_BEGIN(WhiteCardViewControllerSpec)
describe(@"WhiteCardViewController", ^{
  let(whiteCardViewController, ^WhiteCardViewController *{
    return FGBuild(WhiteCardViewController.class);
  });

  specify(^{
    [[whiteCardViewController should] beKindOfClass:CardViewController.class];
  });
});
SPEC_END
