//
//  ArrayTests.swift
//  THGFoundation
//
//  Created by Brandon Sneed on 4/4/15.
//  Copyright (c) 2015 TheHolyGrail. All rights reserved.
//

import XCTest
import THGFoundation

func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.value == rhs.value
}

struct Item: Equatable {
    let value: String
}

class ArrayTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testArrayByRemoving() {
        let item1 = Item(value: "1")
        let item2 = Item(value: "2")
        let item3 = Item(value: "3")
        let item4 = Item(value: "4")
        let item5 = Item(value: "5")
        let item6 = Item(value: "6")

        let items = [item1, item4, item5]
        let array = [item1, item2, item3, item4, item6]

        // result should have item2, item3, and item6 in it.
        // it should skip over item5 entirely since it's not in 'array'.
        let result = arrayByRemoving(items: items, fromArray: array)

        XCTAssertTrue(result.count == 3, "result should have 3 items in it!")
        XCTAssertTrue(result[0] == item2, "[0] should be item2!")
        XCTAssertTrue(result[1] == item3, "[0] should be item2!")
        XCTAssertTrue(result[2] == item6, "[0] should be item2!")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
