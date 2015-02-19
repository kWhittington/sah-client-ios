//
//  Hand.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 2/15/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hand : NSObject

@property(readonly) NSArray *cards;

+ (Hand *)testHand;

- (void)removeCards:(NSArray *)cards;

@end
