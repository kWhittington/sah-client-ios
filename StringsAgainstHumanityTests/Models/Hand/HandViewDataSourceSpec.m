//
//  HandViewDataSourceSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/22/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "test_header.pch"
#import <UIKit/UIKit.h>
#import "HandViewDataSource.h"

 SpecBegin(HandViewDataSource)

  describe(@"HandViewDataSource", ^{
    __block HandViewDataSource *subject;

    beforeAll(^{
      subject = [[HandViewDataSource alloc] init];
    });

    beforeEach(^{

    });

    afterEach(^{

    });

    afterAll(^{

    });

    it(@"conforms to UICollectionViewDataSource protocol", ^{
      expect(10).to.beLessThan(5);
    });

    it(@"fails", ^{
      expect(10).to.beNil;
    });
  });

 SpecEnd
