//
//  HandViewDataSourceSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/22/15.
//  Copyright 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import <UIKit/UIKit.h>
#import "HandViewDataSource.h"

SPEC_BEGIN(HandViewDataSourceSpec)

describe(@"HandViewDataSource", ^{
  let(subject, ^{
    return [[HandViewDataSource alloc] init];
  });

  specify(^{
    [[subject should] conformToProtocol:@protocol(UICollectionViewDataSource)];
  });

  describe(@"cardAtIndexPath:", ^{
    context(@"when there are cards", ^{
            });
  });

});

SPEC_END
