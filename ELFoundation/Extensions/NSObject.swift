//
//  NSObject.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 12/8/15.
//  Copyright © 2015 WalmartLabs. All rights reserved.
//

import Foundation

extension NSObject {
    /**
    Returns the NSBundle containing self's class.
    */
    public static func bundle() -> NSBundle {
        return NSBundle(forClass: self)
    }
    
    /**
    Returns the NSBundle containing self's class.
    */
    public func bundle() -> NSBundle {
        return NSBundle(forClass: self.dynamicType)
    }
    
    /**
    Returns a plugin ID based on bundleID and class name.
    */
    public func pluginID() -> String {
        let bundleID = self.dynamicType.bundle().reverseBundleIdentifier()
        return "\(bundleID).\(self.dynamicType)"
    }
}
