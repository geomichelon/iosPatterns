# Builder

## Intent
Separate the construction of a complex object from its representation so the same process can create different representations.

## When to use
Use when an object has many optional parameters or configuration steps that would make initializers noisy.

## Project structure
`RequestBuilder` assembles `NetworkRequest` step by step.

## Swift example
File: `Sources/PatternsIOS/Patterns/Builder/Swift/Builder.swift`

Key points:
- Default values inside the builder.
- Fluent methods returning `self`.
- `build()` returns an immutable request.

## SwiftUI example
File: `Sources/PatternsIOS/Patterns/Builder/SwiftUI/RequestPreviewView.swift`

The view shows a summary of the built request.

## Unit test
File: `Tests/PatternsIOSTests/Patterns/BuilderTests.swift`

The test verifies method, path, headers, and body.

## How to try it
Open Builder in the app to see the sample request.

## Diagram (text)

+---------+      +-----------------+
| Client  | ---> | RequestBuilder  |
+---------+      +-----------------+
                      | build()
                      v
                +---------------+
                | NetworkRequest|
                +---------------+

## References
- Refactoring.Guru: https://refactoring.guru/design-patterns/builder
- Wikipedia: https://en.wikipedia.org/wiki/Builder_pattern
