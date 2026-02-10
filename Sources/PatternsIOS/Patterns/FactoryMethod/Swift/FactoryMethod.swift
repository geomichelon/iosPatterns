import Foundation

// Product protocol exposed to clients.
protocol BadgeShape {
    var name: String { get }
    func area() -> Double
}

// Concrete product.
struct CircleBadge: BadgeShape {
    let radius: Double

    var name: String { "Circle" }

    func area() -> Double {
        Double.pi * radius * radius
    }
}

// Concrete product.
struct SquareBadge: BadgeShape {
    let side: Double

    var name: String { "Square" }

    func area() -> Double {
        side * side
    }
}

// Factory method protocol.
protocol BadgeFactory {
    func makeBadge() -> any BadgeShape
}

// Concrete factory.
struct CircleBadgeFactory: BadgeFactory {
    func makeBadge() -> any BadgeShape {
        CircleBadge(radius: 10)
    }
}

// Concrete factory.
struct SquareBadgeFactory: BadgeFactory {
    func makeBadge() -> any BadgeShape {
        SquareBadge(side: 12)
    }
}
