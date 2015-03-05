//
//  BlackCard.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/4/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "BlackCard.h"

@interface BlackCard ()
@property(strong) NSNumber *draw;
@property(strong) NSNumber *pick;
@end

@implementation BlackCard
+ (NSNumber *)DefaultDrawNumber {
  return @0;
}

+ (NSNumber *)DefaultPickNumber {
  return @1;
}

#pragma mark Designated Initializer
- (instancetype)initWithString:(NSString *)string {
  self = [super initWithString:string];
  
  self.draw = BlackCard.DefaultDrawNumber;
  self.pick = BlackCard.DefaultPickNumber;
  
  return self;
}
@end
