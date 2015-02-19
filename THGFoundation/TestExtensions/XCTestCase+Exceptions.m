#import "XCTestCase+Exceptions.h"

@implementation XCTestCase (Exceptions)

- (void)XCTAssertThrows:(void (^)(void))block :(NSString *)message {
  XCTAssertThrows(block(), @"%@", message);
}

- (void)XCTAssertThrowsSpecific:(void (^)(void))block :(NSString *)exceptionName :(NSString *)message {
  BOOL __didThrow = NO;
  @try {
    block();
  }
  @catch (NSException *exception) {
    __didThrow = YES;
    XCTAssertEqualObjects(exception.name, exceptionName, @"%@", message);
  }
  @catch (...) {
    __didThrow = YES;
    XCTFail(@"%@", message);
  }

  if (!__didThrow) {
    XCTFail(@"%@", message);
  }
}

@end
