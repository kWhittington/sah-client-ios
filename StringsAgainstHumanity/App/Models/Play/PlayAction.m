//
//  PlayAction.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/25/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "PlayAction.h"
#import "Card.h"

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

- (NSUInteger)hash {
  return self.card.hash;
}

- (BOOL)isEqual:(id)object {
  if (self == object) {
    return YES;
  }

  unless([object isKindOfClass:self.class]) { return NO; }

  return [self isEqualToPlayAction:(PlayAction *)object];
}

- (BOOL)isEqualToPlayAction:(PlayAction *)playAction {
  BOOL haveIdenticalCard = self.card == playAction.card;
  BOOL haveIdenticalAction = self.action == playAction.action;

  return haveIdenticalCard && haveIdenticalAction;
}

- (void)perform {
  self.action(self.card);
}
@end
