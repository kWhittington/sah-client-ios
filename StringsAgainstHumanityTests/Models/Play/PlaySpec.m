//
//  PlaySpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

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
  });

  describe(@"+ withCard:andAction:", ^{
    let(withCardandAction, ^{
      return [Play withCard:card andAction:action];
    });

    it(@"has a copy of the given Card", ^{
      [[withCardandAction.card should] equal:card];
      [[withCardandAction.card shouldNot] beIdenticalTo:card];
    });

    it(@"has a reference to the block", ^{
      [[withCardandAction.action should] beIdenticalTo:action];
    });
  });

  describe(@"- init", ^{
    let(init, ^{
      return [[Play alloc] init];
    });

    it(@"has no Card", ^{
      [[init.card should] beNil];
    });

    it(@"has no action", ^{
      [[init.action should] beNil];
    });
  });
});
SPEC_END
