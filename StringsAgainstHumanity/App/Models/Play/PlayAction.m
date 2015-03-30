//
//  PlayAction.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "PlayAction.h"

@interface PlayAction ()
@property(copy, nonatomic) void (^action)(Card *);
@property(weak, nonatomic) Card *card;
@end

@implementation PlayAction
#pragma mark Designated Initializer
+ (instancetype)withCard:(Card *)card andAction:(void (^)(Card *))action {
  PlayAction *playAction = [[PlayAction alloc] init];

  playAction.card = card;
  playAction.action = action;

  return playAction;
}

- (NSString *)debugDescription {
  return self.description;
}

- (NSString *)description {
  return NSStringWithFormat(@"<PlayAction: %p; card = %@; action = %@>", self, self.card,
                            self.action);
}

- (void)perform {
  self.action(self.card);
}
@end
