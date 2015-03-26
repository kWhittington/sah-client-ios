//
//  MainMenuControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/2/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "MainMenuController.h"
#import "Hand+DataSource.h"
#import "Card.h"

SPEC_BEGIN(MainMenuControllerSpec)
describe(@"MainMenuController", ^{
  let(mainMenuController, ^MainMenuController *{
    return [Constants.Storyboard
      instantiateViewControllerWithIdentifier:MainMenuController.StoryboardID];
  });
  
  it(@"subclasses PlaymatController", ^{
    [[mainMenuController should] beKindOfClass:PlaymatController.class];
  });

  describe(@"+ StoryboardID", ^{
    let(storyboardID, ^{
      return MainMenuController.StoryboardID;
    });

    it(@"equals MainMenuController'", ^{
      [[storyboardID should] equal:@"MainMenuController"];
    });
  });
});
SPEC_END
