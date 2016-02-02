//
//  Swizzling.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 12/9/15.
//  Copyright © 2015 WalmartLabs. All rights reserved.
//

import Foundation

/*

For the love of pete and the Flying Spaghetti Monster...

Do not use this stuff unless you've inquired with no less than a Rabbi, a Priest,
and a Shaman... and a few other engineers to figure out if there is a better way.

*/

/**
Swizzles one method for another for a class. Subsequent to executing this, whenever the `original` method is called on 
the `targetClass`, the runtime will execute `replacement` instead.

- parameter targetClass: The class being targeted. For Swift class, this class must be a subclass of `NSObject`.
- parameter original: The original method being swizzled. For Swift class, this method must be marked `dynamic`.
- parameter replacement: The replacement method being swizzled. For Swift class, this method must be marked `dynamic`.
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
