//
//  UnimplementedException.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/12/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnimplementedException : NSException
+ (instancetype)withSelector:(SEL)selector;
@end
