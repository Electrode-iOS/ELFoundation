/*
 
 These files are not to be included in any targets except test case targets.
 Simply drag them to your project and make sure only the Tests target is checked.
 You'll be prompted to create an objc-bridging header.  Say yes, then add
 this to the newly created header:
 
 #import "XCTestCase+Exceptions.h"
 
 These methods should now be accessible from within Swift without doing 
 anything additional.
 
 */

@import Foundation;
@import XCTest;

@interface XCTestCase (Exceptions)

- (void)XCTAssertThrows:(void (^)(void))block :(NSString *)message;
- (void)XCTAssertThrowsSpecific:(void (^)(void))block :(NSString *)name :(NSString *)message;

@end
