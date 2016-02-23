//
//  NSThread.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 3/16/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation

public extension NSThread {

    private static let formatterCacheKey = "ELFoundation.dateFormatter"

    /**
     Creates and returns a date formatter for the format and locale. The first time a format is passed in
     the date formatter is created and cached per thread. This ensures that the costly creation of a date formatter is
     only done once. Formatters are also created per thread as their underlying implementation hasn't been thread-safe
     until recent versions of iOS. This last requirement may be removed in a future version of this method.
     
     - parameter format: The date format for the creating the date formatter.
     - parameter locale: The locale for the date formatter.
     - returns: The date formatter.
     */
    public class func dateFormatter(format: String, locale: NSLocale? = NSLocale.currentLocale()) -> NSDateFormatter {
        let threadDictionary = NSThread.currentThread().threadDictionary

        var cache: Dictionary<String, NSDateFormatter>? = threadDictionary.objectForKey(formatterCacheKey) as? Dictionary<String, NSDateFormatter>
        if cache == nil {
            cache = Dictionary<String, NSDateFormatter>()
        }

        let formatKey = format + "_" + locale!.localeIdentifier
        if let existing = cache?[formatKey] {
            return existing
        }

        let result = NSDateFormatter()
        result.locale = locale
        result.dateFormat = format
        cache?[formatKey] = result

        threadDictionary[formatterCacheKey] = cache

        return result;
    }
}
