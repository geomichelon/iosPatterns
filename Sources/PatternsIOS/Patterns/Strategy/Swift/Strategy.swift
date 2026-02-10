import Foundation

// Context data used by strategies.
struct Order {
    let subtotal: Double
    let distanceKm: Double
}

// Strategy protocol.
protocol ShippingStrategy {
    var name: String { get }
    func cost(for order: Order) -> Double
}

// Concrete strategy.
struct StandardShipping: ShippingStrategy {
    let name = "Standard"

    func cost(for order: Order) -> Double {
        5 + order.distanceKm * 0.2
    }
}

// Concrete strategy.
struct ExpressShipping: ShippingStrategy {
    let name = "Express"

    func cost(for order: Order) -> Double {
        12 + order.distanceKm * 0.35
    }
}

// Context that delegates to the selected strategy.
final class ShippingCostCalculator {
    var strategy: any ShippingStrategy

    init(strategy: any ShippingStrategy) {
        self.strategy = strategy
    }

    func cost(for order: Order) -> Double {
        strategy.cost(for: order)
    }
}
