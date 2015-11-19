//
//  ObjectAssociation.swift
//  THGFoundation
//
//  Created by Brandon Sneed on 8/11/15.
//  Copyright © 2015 TheHolyGrail. All rights reserved.
//

import Foundation

final private class Wrapper<T>: NSObject {
    var value: T?
    init(_ x: T) {
        value = x
    }
}

/**
Sets an value to be associated with 'object'.  Be careful when using swift types 
like Arrays and whatnot where mutability is involved.
*/
public func setAssociatedObject<T>(object: AnyObject, value: T, associativeKey: UnsafePointer<Void>, policy: objc_AssociationPolicy) {
    //print("set, T = \(T.self)")
    objc_setAssociatedObject(object, associativeKey, Wrapper(value),  policy)
}

/**
Gets a value associated with 'object'.  Be careful when using swift types
like Arrays and whatnot where mutability is involved.
*/
public func getAssociatedObject<T>(object: AnyObject, associativeKey: UnsafePointer<Void>) -> T! {
    let result = objc_getAssociatedObject(object, associativeKey)
    //print("get, T = \(T.self)")
    if let v = result as? Wrapper<T> {
        return v.value
    } else {
        return nil
    }
}
