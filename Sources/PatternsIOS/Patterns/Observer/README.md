# Observer

## Intent
Define a one-to-many dependency so that when one object changes state, all its dependents are notified.

## When to use
Use when multiple parts of the app need to react to changes in a central object without tight coupling.

## Project structure
`WeatherStation` keeps weak observers and notifies them on updates.

## Swift example
File: `Sources/PatternsIOS/Patterns/Observer/Swift/Observer.swift`

Components:
- `WeatherObserver` protocol
- `WeatherStation` with `addObserver` and `removeObserver`

## SwiftUI example
File: `Sources/PatternsIOS/Patterns/Observer/SwiftUI/WeatherStationView.swift`

`WeatherViewModel` subscribes to the station and updates the UI on change.

## Unit test
File: `Tests/PatternsIOSTests/Patterns/ObserverTests.swift`

The test ensures the observer receives the temperature update.

## How to try it
Open Observer in the app and tap Refresh to trigger updates.

## Diagram (text)

+-----------+        +----------------+
| ObserverA | <----> | WeatherStation |
+-----------+        +----------------+
+-----------+               |
| ObserverB | <-------------+
+-----------+     notify()

## References
- Refactoring.Guru: https://refactoring.guru/design-patterns/observer
- Wikipedia: https://en.wikipedia.org/wiki/Observer_pattern
