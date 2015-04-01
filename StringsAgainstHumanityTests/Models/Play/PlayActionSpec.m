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
  let(card, ^Card *{
    return FGBuild(Card.class);
  });

  let(playAction, ^PlayAction *{
    return card.playAction;
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
      return NSStringWithFormat(@"<PlayAction: %p; card = %p; action = %@>", playAction,
                                playAction.card, playAction.action);
    });

    it(@"equals expectedString", ^{
      [[description should] equal:expectedString];
    });
  });

  describe(@"- hash", ^{
    let(hash, ^{
      return theValue(playAction.hash);
    });

    it(@"is equal to .card.hash", ^{
      [[hash should] equal:theValue(playAction.card.hash)];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return theValue(nil);
    });

    let(isEqual, ^{
      return theValue([playAction isEqual:other]);
    });

    context(@"when other is not a PlayAction", ^{
      let(other, ^{
        return GZWords.sentence;
      });

      it(@"is NO", ^{
        [[isEqual should] beNo];
      });
    });

    context(@"when other is a PlayAction", ^{
      let(other, ^{
        return ((Card *)FGBuild(Card.class)).playAction;
      });

      context(@"when other is identical to PlayAction", ^{
        let(other, ^{
          return playAction;
        });

        it(@"is YES", ^{
          [[isEqual should] beYes];
        });
      });

      context(@"when other is not identical to PlayAction", ^{
        it(@"calls PlayAction - isEqualToPlayAction:other", ^{
          [[playAction should] receive:@selector(isEqualToPlayAction:) withArguments:other];

          [playAction isEqual:other];
        });
      });
    });
  });

  describe(@"- isEqualToPlayAction:", ^{
    let(other, ^{
      return PlayAction.nullMock;
    });

    let(isEqualToPlayAction, ^{
      return theValue([playAction isEqualToPlayAction:other]);
    });

    context(@"when other doesn't have an identical .action value", ^{
      let(other, ^{
        return FGBuildTrait(PlayAction.class, @"withDifferentAction");
      });

      it(@"is NO", ^{
        [[isEqualToPlayAction should] beNo];
      });
    });

    context(@"when other has an identical .action values", ^{
      let(other, ^{
        return FGBuildWith(PlayAction.class, @{ @"action" : playAction.action });
      });

      it(@"is YES", ^{
        [[isEqualToPlayAction should] beYes];
      });
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
