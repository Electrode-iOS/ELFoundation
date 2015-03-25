//
//  NSError.swift
//  THGFoundation
//
//  Created by Brandon Sneed on 3/25/15.
//  Copyright (c) 2015 TheHolyGrail. All rights reserved.
//

import Foundation

public protocol NSErrorEnum {
    var rawValue: Int { get }
    var domain: String { get }
    var errorDescription: String { get }
}

extension NSError {
    convenience public init(_ code: NSErrorEnum) {
        self.init(domain:code.domain, code: code.rawValue, userInfo: [NSLocalizedDescriptionKey: code.errorDescription])
    }
}