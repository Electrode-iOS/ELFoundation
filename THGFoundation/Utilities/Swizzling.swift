//
//  Swizzling.swift
//  THGFoundation
//
//  Created by Brandon Sneed on 12/9/15.
//  Copyright © 2015 TheHolyGrail. All rights reserved.
//

import Foundation

/*

For the love of pete and the Flying Spaghetti Monster...

Do not use this stuff unless you've inquired with no less than a Rabbi, a Priest,
and a Shaman... and a few other engineers to figure out if there is a better way.

*/

public func unsafeSwizzle(targetClass: AnyObject.Type, original: Selector, replacement: Selector) {
    let originalMethod = class_getInstanceMethod(targetClass, original)
    let replacementMethod = class_getInstanceMethod(targetClass, replacement)
    
    let didAddMethod = class_addMethod(targetClass, original, method_getImplementation(replacementMethod), method_getTypeEncoding(replacementMethod))
    
    if didAddMethod {
        class_replaceMethod(targetClass, replacement, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, replacementMethod);
    }
}