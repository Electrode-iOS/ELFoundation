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
