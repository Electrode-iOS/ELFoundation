//
//  NSObject.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 12/8/15.
//  Copyright © 2015 WalmartLabs. All rights reserved.
//

import Foundation

public extension NSObject {
    /// Returns the NSBundle containing self's class.
    public static func bundle() -> Bundle {
        return Bundle(for: self)
    }
    
    /// Returns the NSBundle containing self's class.
    public func bundle() -> Bundle {
        return type(of: self).bundle()
    }
}
