//
//  NSObject.swift
//  THGFoundation
//
//  Created by Brandon Sneed on 12/8/15.
//  Copyright © 2015 TheHolyGrail. All rights reserved.
//

import Foundation

extension NSObject {
    public static func bundle() -> NSBundle {
        return NSBundle(forClass: self)
    }
}