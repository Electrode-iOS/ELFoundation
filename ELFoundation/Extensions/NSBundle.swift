//
//  NSBundle.swift
//  THGDispatch
//
//  Created by Brandon Sneed on 2/16/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation

// this needs to move into whatever our equiv for SDFoundation is.

public extension NSBundle {
    
    /**
    Returns the reverse DNS style bundle identifier

    - returns: The reverse DNS style bundle identifier
    
    Example: com.theholygrail.thgfoundation
    */
    public func reverseBundleIdentifier() -> String? {
        if let id = bundleIdentifier {
            let components: [String] = id.componentsSeparatedByString(".")
            let reverseComponents = Array(components.reverse())
            let result = reverseComponents.joinWithSeparator(".")
            return result
        }
        
        return nil
    }
    
}
