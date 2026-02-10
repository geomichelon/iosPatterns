# Factory Method

## Intent
Define an interface for creating an object, but let subclasses decide which class to instantiate.

## When to use
Use when the creation logic varies and you want to decouple clients from concrete types.

## Project structure
`BadgeFactory` defines `makeBadge()`. Concrete factories create specific badges.

## Swift example
File: `Sources/PatternsIOS/Patterns/FactoryMethod/Swift/FactoryMethod.swift`

Main types:
- `BadgeShape` protocol
- `CircleBadge` and `SquareBadge`
- `CircleBadgeFactory` and `SquareBadgeFactory`

## SwiftUI example
File: `Sources/PatternsIOS/Patterns/FactoryMethod/SwiftUI/FactoryMethodView.swift`

The view depends only on the factory interface, not on concrete products.

## Unit test
File: `Tests/PatternsIOSTests/Patterns/FactoryMethodTests.swift`

Tests validate the returned type and the computed area.

## How to try it
Open Factory Method in the app to see the badge produced by the factory.

## Diagram (text)

+---------+      +-----------------+
| Client  | ---> | BadgeFactory    |
+---------+      +-----------------+
                      | makeBadge()
                      v
                +-------------+
                | BadgeShape  |
                +-------------+
                 ^        ^
+---------------------+  +---------------------+
| CircleBadgeFactory  |  | SquareBadgeFactory  |
+---------------------+  +---------------------+

## References
- Refactoring.Guru: https://refactoring.guru/design-patterns/factory-method
- Wikipedia: https://en.wikipedia.org/wiki/Factory_method_pattern
