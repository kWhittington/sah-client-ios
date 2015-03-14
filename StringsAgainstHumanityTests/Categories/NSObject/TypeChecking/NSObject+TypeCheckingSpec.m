//
//  NSObject+TypeCheckingSpec.m
//  StringsAgainstHumanity
//
//  Created by Kyle Whittington on 3/14/15.
//  Copyright (c) 2015 Kyle Whittington. All rights reserved.
//

#import "TestLibraries.pch"
#import "NSObject+TypeChecking.h"

@interface SuperClass : NSObject

@end

@implementation SuperClass

@end

@interface SubClass : SuperClass

@end

@implementation SubClass

@end

@interface ThirdClass : NSObject

@end

@implementation ThirdClass

@end

SPEC_BEGIN(NSObjectTypeCheckingSpec)
describe(@"NSObject+TypeChecking", ^{
  let(superClass, ^SuperClass *{
    return [SuperClass new];
  });

  let(subClass, ^SubClass *{
    return [SubClass new];
  });

  let(thirdClass, ^ThirdClass *{
    return [ThirdClass new];
  });

  describe(@"- kindOf:", ^{
    let(class, ^{
      return theValue(nil);
    });

    let(object, ^{
      return theValue(nil);
    });

    let(result, ^{
      return theValue([object kindOf:class]);
    });

    context(@"when NSObject is an instance of the Class", ^{
      let(class, ^{
        return SuperClass.class;
      });

      let(object, ^{
        return superClass;
      });

      it(@"returns YES", ^{
        [[result should] beYes];
      });
    });

    context(@"when NSObject is an instance of a subclass of the Class", ^{
      let(class, ^{
        return SuperClass.class;
      });

      let(object, ^{
        return subClass;
      });

      it(@"returns YES", ^{
        [[result should] beYes];
      });
    });

    context(@"when NSObject is not an instance of the Class", ^{
      let(class, ^{
        return ThirdClass.class;
      });

      let(object, ^{
        return subClass;
      });

      it(@"returns NO", ^{
        [[result should] beNo];
      });
    });
    
    context(@"when NSObject is an instance of a superclass of the Class", ^{
      let(class, ^{
        return ThirdClass.class;
      });
      
      let(object, ^{
        return SuperClass.class;
      });
      
      it(@"returns NO", ^{
        [[result should] beNo];
      });
    });
  });
});
SPEC_END
