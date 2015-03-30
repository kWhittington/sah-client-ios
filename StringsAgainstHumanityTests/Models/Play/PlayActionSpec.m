//
//  PlayActionSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import ObjectiveC.runtime;
#import "TestLibraries.pch"
#import "PlayAction.h"
#import "Card.h"

SPEC_BEGIN(PlayActionSpec)
describe(@"Play", ^{
  let(playAction, ^PlayAction *{
    return FGBuild(PlayAction.class);
  });

  let(card, ^Card *{
    return playAction.card;
  });

  __block void (^action)(Card *);

  beforeEach(^{
    action = playAction.action;
  });

  it(@"subclasses NSObject", ^{
    [[playAction should] beKindOfClass:NSObject.class];
  });

  describe(@".action", ^{
    __block objc_property_t actionProperty;

    beforeEach(^{
      actionProperty = class_getProperty(PlayAction.class, "action");
    });

    it(@"is a copy of the original action block", ^{
      char *copyAttributeValue = property_copyAttributeValue(actionProperty, "C");

      [[theValue(copyAttributeValue) shouldNot] beNil];
    });
  });

  describe(@".card", ^{
    let(card, ^{
      return playAction.card;
    });

    specify(^{
      [[card should] beKindOfClass:Card.class];
    });

    it(@"is a weak reference to the original Card", ^{
      objc_property_t cardProperty = class_getProperty(PlayAction.class, "card");
      char *weakAttributeValue = property_copyAttributeValue(cardProperty, "W");

      [[theValue(weakAttributeValue) shouldNot] beNil];
    });
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return playAction.debugDescription;
    });

    it(@"equals - description", ^{
      [[debugDescription should] equal:playAction.description];
    });
  });

  describe(@"- description", ^{
    let(description, ^{
      return playAction.description;
    });

    let(expectedString, ^{
      return NSStringWithFormat(@"<PlayAction: %p; card = %@; action = %@>", playAction,
                                playAction.card, playAction.action);
    });

    it(@"equals expectedString", ^{
      [[description should] equal:expectedString];
    });
  });

  describe(@"- perform", ^{
    __block void (^newAction)(Card *);
    __block int count;

    beforeAll(^{
      count = 0;

      newAction = ^(Card *card) {
        NSLog(@"This is a new action. %@", card);
        count = count + 1;
      };
    });

    let(playAction, ^PlayAction *{
      return FGBuildWith(PlayAction.class, @{ @"action" : newAction });
    });

    it(@"executes .action with .card", ^{
      [[theBlock(^{
        [playAction perform];
      }) should] change:^NSInteger {
        return count;
      }];
    });
  });
});
SPEC_END
