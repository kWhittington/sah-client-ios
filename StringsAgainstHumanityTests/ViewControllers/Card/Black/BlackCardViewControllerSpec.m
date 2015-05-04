//
//  BlackCardViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"

#import "BlackCard.h"
#import "BlackCardView.h"
#import "BlackCardViewController.h"

SPEC_BEGIN(BlackCardViewControllerSpec)
describe(@"BlackCardViewController", ^{
  let(blackCardViewController, ^BlackCardViewController *{
    return FGBuild(BlackCardViewController.class);
  });

  it(@"is a kind of card view controller", ^{
    [[blackCardViewController should] beKindOfClass:CardViewController.class];
  });

  describe(@".card", ^{
    let(card, ^{
      return blackCardViewController.card;
    });

    it(@"is a kind of black card", ^{
      [[card should] beKindOfClass:BlackCard.class];
    });
  });

  describe(@"- blackCard", ^{
    let(blackCard, ^{
      return blackCardViewController.blackCard;
    });

    it(@"is the card cast as a black card", ^{
      [[blackCard should] beIdenticalTo:blackCardViewController.card];
    });
  });

  describe(@"- blackCardView", ^{
    let(blackCardView, ^{
      return blackCardViewController.blackCardView;
    });

    it(@"is the card view cast as a black card view", ^{
      [[blackCardView should] beIdenticalTo:blackCardViewController.cardView];
    });
  });

  describe(@"- cardView", ^{
    let(cardView, ^{
      return blackCardViewController.cardView;
    });

    it(@"is a kind of black card view", ^{
      [[cardView should] beKindOfClass:BlackCardView.class];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return NSObject.nullMock;
    });

    let(isEqual, ^{
      return theValue([blackCardViewController isEqual:other]);
    });

    context(@"when both objects are identical", ^{
      let(other, ^{
        return blackCardViewController;
      });

      it(@"is YES", ^{
        [[isEqual should] beYes];
      });
    });

    context(@"when other is a black card view controller", ^{
      context(@"when both black cards are equal", ^{
        let(other, ^{
          return FGBuildWith(BlackCardViewController.class, ^(FGDefinitionBuilder *builder) {
            builder[@"blackCard"] = blackCardViewController.blackCard;
          });
        });

        it(@"is YES", ^{
          [[isEqual should] beYes];
        });
      });

      context(@"when both black cards are not equal", ^{
        let(other, ^{
          return FGBuild(BlackCardViewController.class);
        });

        it(@"is NO", ^{
          [[isEqual should] beNo];
        });
      });
    });

    context(@"when other is not a black card view controller", ^{
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
      return theValue([blackCardViewController isEqualToCardViewController:other]);
    });

    context(@"when other is a black card view controller", ^{
      context(@"when both black cards are equal", ^{
        let(other, ^{
          return FGBuildWith(BlackCardViewController.class, ^(FGDefinitionBuilder *builder) {
            builder[@"blackCard"] = blackCardViewController.blackCard.copy;
          });
        });

        it(@"is YES", ^{
          [[isEqualToCardViewController should] beYes];
        });
      });

      context(@"when both black cards are not equal", ^{
        let(other, ^{
          return FGBuild(BlackCardViewController.class);
        });

        it(@"is NO", ^{
          [[isEqualToCardViewController should] beNo];
        });
      });
    });

    context(@"when other is not a black card view controller", ^{
      let(other, ^{
        return FGBuild(CardViewController.class);
      });

      it(@"is NO", ^{
        [[isEqualToCardViewController should] beNo];
      });
    });
  });

  describe(@"- isEqualToBlackCardViewController:", ^{
    let(other, ^{
      return BlackCardViewController.nullMock;
    });

    let(isEqualToBlackCardViewController, ^{
      return theValue([blackCardViewController isEqualToBlackCardViewController:other]);
    });

    context(@"when both black cards are equal", ^{
      let(other, ^{
        return FGBuildWith(BlackCardViewController.class, ^(FGDefinitionBuilder *builder) {
          builder[@"blackCard"] = blackCardViewController.blackCard.copy;
        });
      });

      it(@"is YES", ^{
        NSLog(@"%@", other);
        [[isEqualToBlackCardViewController should] beYes];
      });
    });

    context(@"when both black cards are not equal", ^{
      let(other, ^{
        return FGBuild(BlackCardViewController.class);
      });

      it(@"is NO", ^{
        [[isEqualToBlackCardViewController should] beNo];
      });
    });
  });
});
SPEC_END
