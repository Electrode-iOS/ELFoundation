//
//  DispatchQueue.swift
//  ELFoundation
//
//  Created by Angelo Di Paolo on 12/11/16.
//  Copyright © 2016 WalmartLabs. All rights reserved.
//

import Foundation

extension DispatchQueue {
    /**
     Execute a closure asynchronously at a delayed time.
     
     - parameter delay: The time to wait before running the closure, in milliseconds.
    */
    public func asyncAfter(delay: DispatchTimeInterval, execute work: @escaping @convention(block) () -> Swift.Void) {
        let deadline = DispatchTime.now() + delay
        asyncAfter(deadline: deadline, execute: work)
    }
}
