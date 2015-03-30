//
//  PlaySpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import ObjectiveC.runtime;
#import "TestLibraries.pch"
#import "Play.h"
#import "Card.h"

SPEC_BEGIN(PlaySpec)
describe(@"Play", ^{
  let(play, ^Play *{
    return FGBuild(Play.class);
  });

  let(card, ^Card *{
    return play.card;
  });

  __block void (^action)(Card *);

  beforeEach(^{
    action = play.action;
  });

  it(@"subclasses NSObject", ^{
    [[play should] beKindOfClass:NSObject.class];
  });

  // NOTE:
  //  Cannot think of how to test the block property.

  describe(@".card", ^{
    let(card, ^{
      return play.card;
    });

    specify(^{
      [[card should] beKindOfClass:Card.class];
    });

    it(@"is a weak reference", ^{
      objc_property_t cardProperty = class_getProperty(Play.class, "card");
      NSString *copyAttributeValue =
        [NSString stringWithUTF8String:property_copyAttributeValue(cardProperty, "W")];

      [[copyAttributeValue should] equal:[NSString string]];
    });
  });

  describe(@"- debugDescription", ^{
    let(debugDescription, ^{
      return play.debugDescription;
    });

    it(@"equals - description", ^{
      [[debugDescription should] equal:play.description];
    });
  });

  describe(@"-description", ^{
    let(description, ^{
      return play.description;
    });

    let(expectedString, ^{
      return NSStringWithFormat(@"<Play: %p; card = %@; action = %@>", play, play.card,
                                play.action);
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

    let(play, ^Play *{
      return FGBuildWith(Play.class, @{ @"action" : newAction });
    });

    it(@"executes .action with .card", ^{
      [[theBlock(^{
        [play perform];
      }) should] change:^NSInteger {
        return count;
      }];
    });
  });
});
SPEC_END
