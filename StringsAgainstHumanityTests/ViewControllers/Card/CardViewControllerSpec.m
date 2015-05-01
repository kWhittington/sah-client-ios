//
//  CardViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/1/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
@import UIKit;
#import "CardViewController.h"
#import "Card.h"

SPEC_BEGIN(CardViewControllerSpec)
describe(@"CardViewController", ^{
  let(cardViewController, ^CardViewController *{
    return FGBuild(CardViewController.class);
  });
});
SPEC_END
