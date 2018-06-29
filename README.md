# ELFoundation 

[![Build Status](https://travis-ci.org/Electrode-iOS/ELFoundation.svg?branch=master)](https://travis-ci.org/Electrode-iOS/ELFoundation)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

ELFoundation is a collection of Swift utilities for iOS development.

## Requirements

ELFoundation requires Swift 4 and Xcode 9.2.

## Installation

### Carthage

Install with [Carthage](https://github.com/Carthage/Carthage) by adding the framework to your project's [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

```
github "Electrode-iOS/ELFoundation"
```

### Manual

Install by adding `ELFoundation.xcodeproj` to your project and configuring your target to link `ELFoundation.framework` from `ELFoundation` target.

There are two target that builds `ELFoundation.framework`.
1. `ELFoundation`: Creates dynamicly linked `ELFoundation.framework.`
2. `ELFoundation_static`: Creates staticly linked `ELFoundation.framework`.

Both targets build the same product (`ELFoundation.framework`), thus linking the same app against both `ELFoundation` and `ELFoundation_static` should be avoided.

## Usage

* `exceptionFailure` - A replacement for assertionFailure, usable in tests.
* `synchronized<T>` - Akin to @synchronized() in Objective-C.
* `Spinlock` - A basic spinlock implementation for synchronization.
* `Object Association` - Objective-C style object association.
* `Swizzling` - Objective-C style swizzling.
* `Array (extensions)` - Handy extensions.
* `NSObject (extensions)` - Handy extensions.
* `NSThread (extensions)` - Handy extensions.
* `NSBundle (extensions)` - Handy extensions.
* `XCTestCase (extensions)` - Gets XCTAssertThrows working in Swift.

## Some Examples

Synchronized property access:

```Swift
public var suspended: Bool {
    get {
        return lock.around {
            self.suspended
        }
    }
    
    set(value) {
        lock.around {
            self.suspended = value
        }
    }
}
```
