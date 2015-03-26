//
//  Play.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "Play.h"

@interface Play ()
@property(copy, nonatomic) Card *card;
@property(nonatomic) void (^action)(Card *);
@end

@implementation Play
#pragma mark Designated Initializer
+ (instancetype)withCard:(Card *)card andAction:(void (^)(Card *))action {
  Play *play = [[Play alloc] init];

  play.card = card;
  play.action = action;

  return play;
}
@end
