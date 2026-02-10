# Singleton

## Intent
Ensure a class has only one instance and provide a global access point to it.

## When to use
Use when a single shared object is required across the app, such as configuration, caches, or logging. Avoid when dependency injection would keep the code more testable.

## Project structure
`AppConfig` stores global configuration and exposes access through `shared`.

## Swift example
File: `Sources/PatternsIOS/Patterns/Singleton/Swift/Singleton.swift`

Key points:
- `static let shared` creates the single instance.
- `private init()` prevents external construction.
- `resetForTests()` makes tests deterministic.

## SwiftUI example
File: `Sources/PatternsIOS/Patterns/Singleton/SwiftUI/AppConfigView.swift`

The view edits local state and writes back to the singleton on Save.

## Unit test
File: `Tests/PatternsIOSTests/Patterns/SingletonTests.swift`

The test verifies the single instance and reset behavior.

## How to try it
Open the app and navigate to Singleton to edit the config values.

## Diagram (text)

+---------+        +--------------------+
| Client  | -----> | AppConfig.shared   |
+---------+        +--------------------+
                         |
                         v
                   +-----------+
                   | AppConfig |
                   +-----------+

## References
- Refactoring.Guru: https://refactoring.guru/design-patterns/singleton
- Wikipedia: https://en.wikipedia.org/wiki/Singleton_pattern
