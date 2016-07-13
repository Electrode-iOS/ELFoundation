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

public extension NSObject {
    /// Swizzles a class method on an Objective-C object.
    public class func swizzleClassMethod(originalSelector: Selector, swizzledSelector:Selector) {
        if let c: AnyClass = object_getClass(self) {
            let originalMethod = class_getClassMethod(c, originalSelector)
            let swizzledMethod = class_getClassMethod(c, swizzledSelector)
            
            let didAddMethod = class_addMethod(c, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                class_replaceMethod(c, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    }
    
    /// Swizzles an instance method on an Objective-C object.
    public class func swizzleInstanceMethod(originalSelector: Selector, swizzledSelector:Selector) {
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        
        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
    
}


/*
 
 Future idea:
 
 
 dr_sneed [11:10 AM]
 you know what would be neat?
 
 [11:11]
 a hookMethod(someSelector, options: .After) { … }
 
 [11:11]
 so i could have my block execute after someSelector is called.
 
 [11:11]
 or .Before
 
 */

