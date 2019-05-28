//
//  Synchronization.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 2/19/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation

/**
 Mimics @synchronized(x) in Objective-C.  Synchronizes around the given object
 and executes the supplied closure.

 - parameter lock: Object to lock around.
 - parameter closure: Closure to execute inside of the lock.

 Example: synchronized(self) { doSomething() }
*/
public func synchronized(_ lock: AnyObject, closure: () -> Void) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}

/**
 Mimics @synchronized(x) in Objective-C.  Synchronizes around the given object
 and executes the supplied closure, returning the type T.

 - parameter lock: Object to lock around.
 - parameter closure: Closure to execute inside of the lock.
 - returns: The result of the closure.

 Example: let running = synchronized(self) { return true }
*/
public func synchronized<T>(_ lock: AnyObject, closure: () -> T) -> T {
    objc_sync_enter(lock)
    let result: T = closure()
    objc_sync_exit(lock)
    return result
}
