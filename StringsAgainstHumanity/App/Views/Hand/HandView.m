//
//  HandView.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 5/10/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "BirdsEyeHandLayout.h"
#import "HandView.h"

@implementation HandView
+ (instancetype)withFrame:(CGRect)frame {
  return [[self alloc] initWithFrame:frame];
}

+ (instancetype)withMainScreenFrame {
  return [[self alloc] initWithMainScreenFrame];
}

#pragma mark Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame collectionViewLayout:BirdsEyeHandLayout.new];

  if (self) {
  }

  return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
  [NSException raise:@"InitializerDeprecated"
              format:@"HandView should be initialized via - initWithFrame:, its layout should not "
              @"be set by the user."];

  return [self initWithFrame:frame];
}

- (instancetype)initWithMainScreenFrame {
  return [self initWithFrame:UIScreen.mainScreen.bounds];
}

- (BOOL)allowsSelection {
  return YES;
}

- (BOOL)allowsMultipleSelection {
  return NO;
}

- (UIColor *)backgroundColor {
  return UIColor.clearColor;
}

- (UIView *)backgroundView {
  return nil;
}

- (BOOL)isOpaque {
  return YES;
}

- (void)setCollectionViewLayout:(UICollectionViewLayout *)collectionViewLayout {
  [NSException raise:@"ReassignmentNotPermittedException"
              format:@"An attempt to reassign HandView.collectionViewLayout made, its layout "
              @"should not be set by the user."];
}
@end
