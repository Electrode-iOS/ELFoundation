//
//  Array.swift
//  THGFoundation
//
//  Created by Brandon Sneed on 4/4/15.
//  Copyright (c) 2015 TheHolyGrail. All rights reserved.
//

import Foundation

// Swift does not support public extensions of array, so we'll make some functions for now.

/**
Creates a new array by removing `items` from `fromArray`

- parameter items: Array of items to remove.
- parameter fromArray: Array to remove items from.
- returns: A new array with the specified items removed.
*/
public func arrayByRemoving<T: Equatable>(items items: Array<T>, fromArray: Array<T>) -> Array<T> {
    var result = fromArray

    for index in 0..<items.count {
        let item = items[index]
        if let found = result.indexOf(item) {
            result.removeAtIndex(found)
        }
    }

    return result
}


public extension Array {
    
    /**
    Runs the specified block against each element in the array.
    example:
        array.each {
            $0.doSomething()
        }
    */
    func each(block: (object: Element) -> Void) {
        for object in self {
            block(object: object)
        }
    }
    
    /**
    Runs the specified block against each element in the array by index.
    example:
        array.eachWithIndex { (object, index) -> Void in
            object.doSomethingWithIndex(index)
        }
    */
    func eachWithIndex(block: (object: Element, index: Int) -> Void) {
        for (index, object) in self.enumerate() {
            block(object: object, index: index)
        }
    }
    
}