@import Foundation;
@import XCTest;

@interface XCTestCase (Exceptions)

- (void)XCTAssertThrows:(void (^)(void))block :(NSString *)message;
- (void)XCTAssertThrowsSpecific:(void (^)(void))block :(NSString *)name :(NSString *)message;

@end
