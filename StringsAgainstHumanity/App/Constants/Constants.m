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

+ (NSString *)StoryboardName {
  return @"Main";
}

+ (UIColor *)WhiteColor {
  return [UIColor colorWithHexString:@"000000"];
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
