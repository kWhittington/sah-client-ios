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

  describe(@"- identicalTo:", ^{
    context(@"when other == object", ^{
      let(identicalTo, ^{
        return theValue([superClass identicalTo:superClass]);
      });

      specify(^{
        [[identicalTo should] beYes];
      });
    });

    context(@"when other != other", ^{
      let(identicalTo, ^{
        return theValue([superClass identicalTo:SuperClass.new]);
      });

      specify(^{
        [[identicalTo should] beNo];
      });
    });
  });

  describe(@"- instanceOf:", ^{
    let(class, ^{
      return theValue(nil);
    });

    let(object, ^{
      return theValue(nil);
    });

    let(instanceOf, ^{
      return theValue([object instanceOf:class]);
    });

    context(@"when Object is an instance of the Class", ^{
      let(class, ^{
        return SuperClass.class;
      });

      let(object, ^{
        return superClass;
      });

      it(@"returns YES", ^{
        [[instanceOf should] beYes];
      });
    });

    context(@"when Object is not an instance of the Class", ^{
      let(class, ^{
        return SuperClass.class;
      });

      let(object, ^{
        return subClass;
      });

      it(@"returns NO", ^{
        [[instanceOf should] beNo];
      });
    });
  });

  describe(@"- isIdenticalTo:", ^{
    context(@"when other == object", ^{
      let(isIdenticalTo, ^{
        return theValue([superClass isIdenticalTo:superClass]);
      });

      specify(^{
        [[isIdenticalTo should] beYes];
      });
    });

    context(@"when other != object", ^{
      let(isIdenticalTo, ^{
        return theValue([superClass isIdenticalTo:SuperClass.new]);
      });

      specify(^{
        [[isIdenticalTo should] beNo];
      });
    });
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

    context(@"when Object is an instance of the Class", ^{
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

    context(@"when Object is an instance of a subclass of the Class", ^{
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

    context(@"when Object is an instance of a superclass of the Class", ^{
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

    context(@"when Object is an instance not related to the Class", ^{
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
  });
});
SPEC_END
