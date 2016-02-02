//
//  Array.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 4/4/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
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


// MARK: Iteration helpers

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

// MARK: Stack and Queue helpers

public extension Array {
    
    //Stack - LIFO
    mutating func push(newElement: Element) {
        self.append(newElement)
    }
    
    mutating func pop() -> Element? {
        if self.count > 0 {
            return self.removeLast()
        }
        return nil
    }
    
    func peekAtStack() -> Element? {
        if self.count > 0 {
            return self.last
        }
        return nil
    }
    
    //Queue - FIFO
    mutating func enqueue(newElement: Element) {
        self.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        if self.count > 0 {
            return self.removeAtIndex(0)
        }
        return nil
    }
    
    func peekAtQueue() -> Element? {
        if self.count > 0 {
            return self.first
        }
        return nil
    }
}

// MARK: Object removal helpers.

public extension Array where Element : Equatable {
    mutating func removeObject(object : Generator.Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
}
