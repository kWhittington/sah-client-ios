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
});
SPEC_END
