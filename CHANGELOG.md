# [3.0.2](https://github.com/Electrode-iOS/ELFoundation/releases/tag/v3.0.2)

- Store isInUnitTest value in-memory for efficiency

# [3.0.1](https://github.com/Electrode-iOS/ELFoundation/releases/tag/v3.0.1)

- Use default settings for bitcode

# [3.0.0](https://github.com/Electrode-iOS/ELFoundation/releases/tag/v3.0.0)

## New Features

- Added `asyncAfter(delay:)` extension method for `DispatchQueue`

## Fixes

- Avoid passing a nil pointer into `NSException.raise`

## Breaking Changes

- Removed unused `queryDictionary` method. use `URLComponents` instead.
- Removed deprecated Array extensions
- Removed `NSErrorEnum` since it is obsolete with Swift's `Error` type
- Removed GUID() since it is just as easy to call `UUID().uuidString` directly
- Removed unused `pluginIdentifier` methods

# [2.0.1](https://github.com/Electrode-iOS/ELFoundation/releases/tag/v2.0.1)

- Fix missing files in macOS Test target.

# [2.0.0](https://github.com/Electrode-iOS/ELFoundation/releases/tag/v2.0.0)

- Migrate to Swift 3

# [1.1.0](https://github.com/Electrode-iOS/ELFoundation/releases/tag/v1.1.0)

- Add support for Xcode 8, Swift 2.3, and iOS SDK 10

# [1.0.2](https://github.com/Electrode-iOS/ELFoundation/releases/tag/v1.0.2)

- Update schemes to support Xcode 7.3
