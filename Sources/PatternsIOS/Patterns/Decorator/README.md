# Decorator

## Intent
Attach additional responsibilities to an object dynamically without changing its class.

## When to use
Use when you need flexible composition of behavior and want to avoid deep inheritance trees.

## Project structure
`Beverage` defines the interface. Decorators wrap a base beverage and add cost/ingredients.

## Swift example
File: `Sources/PatternsIOS/Patterns/Decorator/Swift/Decorator.swift`

Decorators:
- `MilkDecorator`
- `WhipDecorator`

## SwiftUI example
File: `Sources/PatternsIOS/Patterns/Decorator/SwiftUI/CoffeeOrderView.swift`

The UI toggles decorators and displays the final cost and ingredients.

## Unit test
File: `Tests/PatternsIOSTests/Patterns/DecoratorTests.swift`

The test verifies accumulated cost and ingredient list.

## How to try it
Open Decorator in the app and toggle the add-ons.

## Diagram (text)

+-------------+
| Beverage    |
+-------------+
      ^
+-------------+   wraps   +---------------+   wraps   +--------------+
| SimpleCoffee| <-------  | MilkDecorator | <-------  | WhipDecorator|
+-------------+           +---------------+           +--------------+

## References
- Refactoring.Guru: https://refactoring.guru/design-patterns/decorator
- Wikipedia: https://en.wikipedia.org/wiki/Decorator_pattern
