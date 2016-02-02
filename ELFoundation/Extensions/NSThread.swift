//
//  NSThread.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 3/16/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation

public extension NSThread {

    static private let formatterCacheKey = "ELFoundation.dateFormatter"

    class func dateFormatter(format: String, locale: NSLocale? = NSLocale.currentLocale()) -> NSDateFormatter {
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
