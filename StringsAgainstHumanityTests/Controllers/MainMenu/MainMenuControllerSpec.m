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
    MainMenuController *result = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
      instantiateViewControllerWithIdentifier:MainMenuController.storyboardID];
    [result viewDidLoad];
    return result;
  });
  
  describe(@"+ storyboardID", ^{
    let(result, ^NSString *{
      return MainMenuController.storyboardID;
    });
    
    it(@"returns @\"MainMenuController\"", ^{
      [[result should] equal:@"MainMenuController"];
    });
  });
  
  describe(@"- viewDidLoad", ^{
    let(dataSource, ^Hand *{
      return (Hand *)mainMenuController.collectionView.dataSource;
    });
    
    it(@"empties the Hand and adds one \"Play\" Card", ^{
      [mainMenuController viewDidLoad];
      [[theValue(dataSource.size) should] equal:theValue(1)];
      [[((Card *)dataSource.cards.first).string should] equal:@"Play"];
    });
  });
  
});
SPEC_END
