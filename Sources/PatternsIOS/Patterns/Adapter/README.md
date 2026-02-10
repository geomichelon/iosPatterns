# Adapter

## Intent
Convert the interface of a class into another interface clients expect.

## When to use
Use when integrating legacy or third-party APIs without changing client code.

## Project structure
`LegacyAnalyticsAdapter` adapts `LegacyAnalytics` to the `Analytics` protocol.

## Swift example
File: `Sources/PatternsIOS/Patterns/Adapter/Swift/Adapter.swift`

Key points:
- `Analytics` defines the target interface.
- `LegacyAnalyticsAdapter` translates the call.

## SwiftUI example
File: `Sources/PatternsIOS/Patterns/Adapter/SwiftUI/AnalyticsDebugView.swift`

The view tracks an event through the adapter and shows the legacy result.

## Unit test
File: `Tests/PatternsIOSTests/Patterns/AdapterTests.swift`

The test ensures the adapter forwards data correctly.

## How to try it
Open Adapter in the app and tap Track Sample.

## Diagram (text)

+---------+      +-------------------+      +------------------+
| Client  | ---> | Analytics (target)| ---> | LegacyAnalytics  |
+---------+      +-------------------+      +------------------+
                        ^
                        |
              +------------------------+
              | LegacyAnalyticsAdapter|
              +------------------------+

## References
- Refactoring.Guru: https://refactoring.guru/design-patterns/adapter
- Wikipedia: https://en.wikipedia.org/wiki/Adapter_pattern
