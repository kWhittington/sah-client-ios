//
//  NSObject+TypeChecking.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/14/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

@import Foundation;

@interface NSObject (TypeChecking)
- (BOOL)kindOf:(Class) class;
@end
