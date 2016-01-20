# Excalibur [![Build Status](https://travis-ci.org/WalmartLabs/Excalibur.svg?branch=master)](https://travis-ci.org/WalmartLabs/Excalibur)

Foundational bits, extensions, etc.  This project contains mostly generic functionality.

## A quick word about dependencies

THG projects are designed to live side-by-side in the file system.  ie:

* \MyProject
* \MyProject\Excalibur
* \MyProject\KillerRabbit

We use an experimental tool called [Modulo](https://github.com/setdirection/modulo) for dependency management.  It doesn't require Xcode workspaces, mess with your project, or have arcane config files that break every release, it's simple JSON.  It also doesn't require your dependencies to use Modulo either.  If you're using Modulo, you can also link to an existing git repo that doesn't use Modulo, it doesn't care.

That being said.. you don't have to use Modulo!  You can simple add both of these github projects as submodules and it'll work just the same.

Now back to the good stuff....

## Introduction

ELFoundation/Excalibur is intended to contain very generic functionality.  Helper extensions, lower level constructs, etc.

The following constructs have been implemented:

* `exceptionFailure`: A replacement for assertionFailure, usable in tests.
* `synchronized<T>`: Akin to @synchronized() in Objective-C.
* `Spinlock`: A basic spinlock implementation for synchronization.
* `NSBundle (extensions)`: Handy extensions when working with bundles.
* `XCTestCase (extensions)`: Gets XCTAssertThrows working in Swift.

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

More to come...

## Contributions

We appreciate your contributions to all of our projects and look forward to interacting with you via Pull Requests, the issue tracker, via Twitter, etc.  We're happy to help you, and to have you help us.  We'll strive to answer every PR and issue and be very transparent in what we do.

When contributing code, please refer to our Dennis (https://github.com/WalmartLabs/Dennis).

###### THG's Primary Contributors

Dr. Sneed (@bsneed)<br>
Steve Riggins (@steveriggins)<br>
Sam Grover (@samgrover)<br>
Angelo Di Paolo (@angelodipaolo)<br>
Cody Garvin (@migs647)<br>
Wes Ostler (@wesostler)<br>

## License

The MIT License (MIT)

Copyright (c) 2015 Walmart, WalmartLabs, and other Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

