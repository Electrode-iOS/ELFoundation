//
//  NSObject.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 12/8/15.
//  Copyright © 2015 WalmartLabs. All rights reserved.
//

import Foundation

extension NSObject {
    public static func bundle() -> NSBundle {
        return NSBundle(forClass: self)
    }
}
