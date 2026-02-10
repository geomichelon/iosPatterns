# Strategy

## Intent
Define a family of algorithms, encapsulate each one, and make them interchangeable.

## When to use
Use when different business rules can be swapped at runtime without changing the client.

## Project structure
`ShippingCostCalculator` delegates to a chosen `ShippingStrategy`.

## Swift example
File: `Sources/PatternsIOS/Patterns/Strategy/Swift/Strategy.swift`

Strategies:
- `StandardShipping`
- `ExpressShipping`

## SwiftUI example
File: `Sources/PatternsIOS/Patterns/Strategy/SwiftUI/ShippingOptionsView.swift`

The UI toggles between strategies and shows the calculated cost.

## Unit test
File: `Tests/PatternsIOSTests/Patterns/StrategyTests.swift`

The test compares costs for the same order.

## How to try it
Open Strategy in the app and toggle Express.

## Diagram (text)

+------------------------+
| ShippingCostCalculator |
+------------------------+
            |
            v
    +--------------------+
    | ShippingStrategy   |
    +--------------------+
      ^              ^
+--------------+  +--------------+
| Standard     |  | Express      |
+--------------+  +--------------+

## References
- Refactoring.Guru: https://refactoring.guru/design-patterns/strategy
- Wikipedia: https://en.wikipedia.org/wiki/Strategy_pattern
