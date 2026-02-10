import Foundation

// Component protocol.
protocol Beverage {
    var cost: Double { get }
    var ingredients: [String] { get }
}

// Concrete component.
struct SimpleCoffee: Beverage {
    var cost: Double { 2.0 }
    var ingredients: [String] { ["Coffee"] }
}

// Decorator that adds milk.
struct MilkDecorator: Beverage {
    let base: any Beverage

    var cost: Double { base.cost + 0.5 }
    var ingredients: [String] { base.ingredients + ["Milk"] }
}

// Decorator that adds whipped cream.
struct WhipDecorator: Beverage {
    let base: any Beverage

    var cost: Double { base.cost + 0.7 }
    var ingredients: [String] { base.ingredients + ["Whip"] }
}
