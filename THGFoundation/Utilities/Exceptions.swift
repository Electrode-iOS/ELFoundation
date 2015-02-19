//
//  Exceptions.swift
//  THGFoundation
//
//  Created by Brandon Sneed on 2/19/15.
//  Copyright (c) 2015 TheHolyGrail. All rights reserved.
//

import Foundation

public func exceptionFailure(format: String, arguments: CVarArgType...) {
   NSException.raise("THGFoundationExceptionFailure", format: format, arguments: getVaList(arguments))
}