//
//  TestHelper.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 8/13/15.
//  Copyright © 2015 WalmartLabs. All rights reserved.
//

import Foundation

/**
Determines if a given block of code is being run within the context of
a unit test.
*/
public func isInUnitTest() -> Bool {
    // useful for debugging validity of the environment check below.
    //print(NSProcessInfo.processInfo().environment)
    if NSProcessInfo.processInfo().environment["XCTestConfigurationFilePath"] != nil {
        return true
    }
    return false
}


private enum WaitConditionError: ErrorType {
    case Timeout
}

extension NSObject {
    /**
    Pumps the run loop while waiting for the given conditions check to return true, or the timeout has
    expired.  This function should only be used within unit tests, and will throw an exception if not.
    - parameter timeout: The timeout, in seconds.
    - parameter conditionsCheck: A block that performs the condition check and returns true/false.
    */
    public func waitForConditionsWithTimeout(timeout: NSTimeInterval, conditionsCheck: () -> Bool) throws {
        if isInUnitTest() {
            var condition = false
            let startTime = NSDate()
            
            while (!condition) {
                NSRunLoop.currentRunLoop().runUntilDate(NSDate.distantPast())
                condition = conditionsCheck()
                let currentTime = NSDate().timeIntervalSinceDate(startTime)
                if currentTime > timeout {
                    throw WaitConditionError.Timeout
                }
            }
        } else {
            exceptionFailure("waitForConditionsWithTimeout should only be used in unit tests.")
        }
    }

}
