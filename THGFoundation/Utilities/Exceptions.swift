//
//  Exceptions.swift
//  THGFoundation
//
//  Created by Brandon Sneed on 2/19/15.
//  Copyright (c) 2015 TheHolyGrail. All rights reserved.
//

import Foundation

/*
Raises an exception and can be used on testable code.  This is to be used as an 
alternative to assertionFailure(), which blows up tests.

:param: format Format string to be used.
:param: arguments Argument list to be used in the format string.

Example:  exceptionFailure("This object is invalid.  %@", obj)
*/
public func exceptionFailure(format: String, arguments: CVarArgType...) {
   NSException.raise("THGFoundationExceptionFailure", format: format, arguments: getVaList(arguments))
}