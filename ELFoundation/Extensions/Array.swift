//
//  Array.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 4/4/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation

// MARK: Iteration helpers

public extension Array {
    /**
    Runs the specified block against each element in the array.
    example:
        array.each {
            $0.doSomething()
        }
    */
    func each(_ block: (_ object: Element) -> Void) {
        for object in self {
            block(object)
        }
    }
    
    /**
    Runs the specified block against each element in the array by index.
    example:
        array.eachWithIndex { (object, index) -> Void in
            object.doSomethingWithIndex(index)
        }
    */
    func eachWithIndex(_ block: (_ object: Element, _ index: Int) -> Void) {
        for (index, object) in self.enumerated() {
            block(object, index)
        }
    }
    
    // MARK: Stack and Queue helpers
    //Stack - LIFO
    mutating func push(_ newElement: Element) {
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
    mutating func enqueue(_ newElement: Element) {
        self.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        if self.count > 0 {
            return self.remove(at: 0)
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
    /**
     Removes each occurrence of `element` from this array.
     */
    mutating func removeElement(_ element: Element) {
        while let index = self.firstIndex(of: element) {
            self.remove(at: index)
        }
    }

    /**
     Removes each occurrence of each of the `elements` from this array.

     - Parameter elements: Sequence containing elements to remove.
     */
    mutating func removeElements<S: Sequence>(_ elements: S) where S.Iterator.Element == Element {
        for element in elements {
            self.removeElement(element)
        }
    }

    /**
     Returns a copy of the array with each instance of items in `elements` removed.
     
     - Parameter elements: Sequence containing elements to remove.
     */
    func excludeElements(_ elements: [Element]) -> [Element] {
        var array = self
        array.removeElements(elements)
        return array
    }
}
