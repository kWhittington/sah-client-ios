//
//  StringsAgainstHumanityTests.m
//  StringsAgainstHumanityTests
//
//  Created by Kyle Whittington on 2/5/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "test_header.pch"

SpecBegin(Example)

describe(@"YES", ^{
	BOOL (^subject)(void) = ^{
	    return YES;
	};

	it(@"equals true", ^{
		expect(subject).to.beTruthy();
	});

	it(@"doesn't equal false", ^{
		expect(subject).notTo.beFalsy();
	});
});

describe(@"OCMock", ^{
	it(@"mocks without error", ^{
		NSString *mock_string = mock([NSString class]);
		[given([mock_string isEqualToString:@"not"]) willReturn:@"test"];

		[mock_string isEqualToString:@"not"];

		[verify(mock_string) isEqualToString:startsWith(@"not")];
	});
});

SpecEnd
