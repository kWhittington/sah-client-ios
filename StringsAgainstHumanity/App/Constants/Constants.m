//
//  Constants.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/3/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "SAHLibraries.pch"
#import "Constants.h"

@implementation Constants

+ (UIColor *)BlackColor {
  return [UIColor colorWithHexString:@"1A1818"];
}

+ (UIColor *)WhiteColor {
  return [UIColor colorWithHexString:@"FFFFFF"];
}

- (instancetype)init {
  NSException *cannotBeInstantiatedException =
    [NSException exceptionWithName:@"ClassCannotBeInstantiatedException"
                            reason:@"This class does not allow for instances to be created"
                          userInfo:nil];

  [cannotBeInstantiatedException raise];

  return nil;
}
@end
