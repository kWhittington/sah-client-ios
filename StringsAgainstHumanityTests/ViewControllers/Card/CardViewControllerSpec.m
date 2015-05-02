//
//  CardViewControllerSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/1/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import ObjectiveC.runtime;
@import UIKit;
#import "TestLibraries.pch"
#import "Card.h"
#import "CardView.h"
#import "CardViewController.h"

SPEC_BEGIN(CardViewControllerSpec)
describe(@"CardViewController", ^{
  let(cardViewController, ^CardViewController *{
    return FGBuild(CardViewController.class);
  });

  describe(@".card", ^{
    __block objc_property_t cardProperty;

    beforeEach(^{
      cardProperty = class_getProperty(CardViewController.class, "card");
    });

    it(@"is a Card", ^{
      NSString *typeString = @(property_copyAttributeValue(cardProperty, "T"));

      [[typeString should] equal:@"@\"Card\""];
    });

    it(@"is a strong reference", ^{
      char *strongAttribute = property_copyAttributeValue(cardProperty, "&");

      [[theValue(strongAttribute) shouldNot] beNil];

      free(strongAttribute);
    });

    it(@"is nonatomic", ^{
      char *nonatomicAttribute = property_copyAttributeValue(cardProperty, "N");

      [[theValue(nonatomicAttribute) shouldNot] beNil];

      free(nonatomicAttribute);
    });
  });

  describe(@"- cardView", ^{
    let(cardView, ^{
      return cardViewController.cardView;
    });

    it(@"is the view", ^{
      [[cardView should] beIdenticalTo:cardViewController.view];
    });
  });

  describe(@"- isEqual:", ^{
    let(other, ^{
      return NSObject.nullMock;
    });

    let(isEqual, ^{
      return theValue([cardViewController isEqual:other]);
    });

    context(@"when both objects are identical", ^{
      let(other, ^{
        return cardViewController;
      });

      it(@"is YES", ^{
        [[isEqual should] beYes];
      });
    });

    context(@"when other is a CardViewController", ^{
      context(@"when both card properties are equal", ^{
        let(other, ^{
          return FGBuildWith(CardViewController.class, ^(FGDefinitionBuilder *builder) {
            builder[@"card"] = cardViewController.card;
          });
        });

        it(@"is YES", ^{
          [[isEqual should] beYes];
        });
      });

      context(@"when both card properties are not equal", ^{
        let(other, ^{
          return FGBuild(CardViewController.class);
        });

        it(@"is NO", ^{
          [[isEqual should] beNo];
        });
      });
    });

    context(@"when other is not a CardViewController", ^{
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
      return theValue([cardViewController isEqualToCardViewController:other]);
    });

    context(@"when both card properties are equal", ^{
      let(other, ^{
        return FGBuildWith(CardViewController.class, ^(FGDefinitionBuilder *builder) {
          builder[@"card"] = cardViewController.card;
        });
      });

      it(@"is YES", ^{
        [[isEqualToCardViewController should] beYes];
      });
    });

    context(@"when both card properties are not equal", ^{
      let(other, ^{
        return FGBuild(CardViewController.class);
      });

      it(@"is NO", ^{
        [[isEqualToCardViewController should] beNo];
      });
    });
  });
});
SPEC_END
