//
//  NSBundleTests.swift
//  THGFoundation
//
//  Created by Steven Riggins on 7/7/15.
//  Copyright © 2015 TheHolyGrail. All rights reserved.
//

import XCTest

class NSBundleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testReverseBundleIdentifier() {
        let bundle = NSBundle(identifier: "io.theholygrail.THGFoundation")
        let reverseIdentifier = bundle?.reverseBundleIdentifier()
        
        XCTAssertTrue(reverseIdentifier == "THGFoundation.theholygrail.io")
    }
    
}
