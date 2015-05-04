//
//  WhiteCardViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/13/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"

#import "WhiteCard.h"
#import "WhiteCardView.h"
#import "WhiteCardViewController.h"

SPEC_BEGIN(WhiteCardViewControllerSpec)
describe(@"WhiteCardViewController", ^{
  let(whiteCardViewController, ^WhiteCardViewController *{
    return FGBuild(WhiteCardViewController.class);
  });

  it(@"is a kind of card view controller", ^{
    [[whiteCardViewController should] beKindOfClass:CardViewController.class];
  });

  describe(@"- whiteCard", ^{
    let(whiteCard, ^{
      return whiteCardViewController.whiteCard;
    });

    it(@"is the card cast as a white card", ^{
      [[whiteCard should] beIdenticalTo:whiteCardViewController.card];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return NSObject.nullMock;
    });

    let(isEqual, ^{
      return theValue([whiteCardViewController isEqual:other]);
    });

    context(@"when both objects are identical", ^{
      let(other, ^{
        return whiteCardViewController;
      });

      it(@"is YES", ^{
        [[isEqual should] beYes];
      });
    });

    context(@"when other is a WhiteCardViewController", ^{
      context(@"when both white cards are equal", ^{
        let(other, ^{
          return FGBuildWith(WhiteCardViewController.class, ^(FGDefinitionBuilder *builder) {
            builder[@"whiteCard"] = whiteCardViewController.whiteCard;
          });
        });

        it(@"is YES", ^{
          [[isEqual should] beYes];
        });
      });

      context(@"when both white cards are not equal", ^{
        let(other, ^{
          return FGBuild(WhiteCardViewController.class);
        });

        it(@"is NO", ^{
          [[isEqual should] beNo];
        });
      });
    });

    context(@"when other is not a WhiteCardViewController", ^{
      let(other, ^{
        return GZWords.sentence;
      });

      it(@"is NO", ^{
        [[isEqual should] beNo];
      });
    });
  });

  describe(@"- isEqualToCardViewController:", ^{
    let(other, ^{
      return CardViewController.nullMock;
    });

    let(isEqualToCardViewController, ^{
      return theValue([whiteCardViewController isEqualToCardViewController:other]);
    });

    context(@"when other is a WhiteCardViewController", ^{
      context(@"when both white cards are equal", ^{
        let(other, ^{
          return FGBuildWith(WhiteCardViewController.class, ^(FGDefinitionBuilder *builder) {
            builder[@"whiteCard"] = whiteCardViewController.whiteCard;
          });
        });

        it(@"is YES", ^{
          [[isEqualToCardViewController should] beYes];
        });
      });

      context(@"when both white cards are not equal", ^{
        let(other, ^{
          return FGBuild(WhiteCardViewController.class);
        });

        it(@"is NO", ^{
          [[isEqualToCardViewController should] beNo];
        });
      });
    });

    context(@"when other is not a WhiteCardViewController", ^{
      let(other, ^{
        return FGBuild(CardViewController.class);
      });

      it(@"is NO", ^{
        [[isEqualToCardViewController should] beNo];
      });
    });
  });

  describe(@"- isEqualToWhiteCardViewController:", ^{
    let(other, ^{
      return WhiteCardViewController.nullMock;
    });

    let(isEqualToWhiteCardViewController, ^{
      return theValue([whiteCardViewController isEqualToWhiteCardViewController:other]);
    });

    context(@"when both white cards are equal", ^{
      let(other, ^{
        return FGBuildWith(WhiteCardViewController.class, ^(FGDefinitionBuilder *builder) {
          builder[@"whiteCard"] = whiteCardViewController.whiteCard;
        });
      });

      it(@"is YES", ^{
        [[isEqualToWhiteCardViewController should] beYes];
      });
    });

    context(@"when both white cards are not equal", ^{
      let(other, ^{
        return FGBuild(WhiteCardViewController.class);
      });

      it(@"is NO", ^{
        [[isEqualToWhiteCardViewController should] beNo];
      });
    });
  });

  describe(@"- whiteCardView", ^{
    let(whiteCardView, ^{
      return whiteCardViewController.whiteCardView;
    });

    it(@"is the card view cast as a white card view", ^{
      [[whiteCardView should] beIdenticalTo:whiteCardViewController.cardView];
    });
  });
});
SPEC_END
