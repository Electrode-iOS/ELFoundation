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

:param: items Array of items to remove.
:param: fromArray Array to remove items from.
:returns: A new array with the specified items removed.
*/
public func arrayByRemoving<T: Equatable>(#items: Array<T>, #fromArray: Array<T>) -> Array<T> {
    var result = fromArray

    for index in 0..<items.count {
        let item = items[index]
        let found = find(result, item)
        if let found = found {
            result.removeAtIndex(found)
        }
    }

    return result
}