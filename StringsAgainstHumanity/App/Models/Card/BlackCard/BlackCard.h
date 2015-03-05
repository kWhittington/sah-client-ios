//
//  BlackCard.h
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/4/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "Card.h"

@interface BlackCard : Card
@property(readonly, strong) NSNumber *draw;
@property(readonly, strong) NSNumber *pick;

+ (NSNumber *)DefaultDrawNumber;
+ (NSNumber *)DefaultPickNumber;
@end