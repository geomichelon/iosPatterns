import SwiftUI
import Foundation

struct ShippingOptionsView: View {
    let order: Order
    // UI toggle that selects a different strategy.
    @State private var useExpress: Bool = false

    var body: some View {
        // Switch strategies at runtime based on the UI state.
        let strategy: any ShippingStrategy = useExpress ? ExpressShipping() : StandardShipping()
        let calculator = ShippingCostCalculator(strategy: strategy)
        let cost = calculator.cost(for: order)

        return VStack(spacing: 12) {
            Text("Strategy")
                .font(.title2)
            Toggle("Express", isOn: $useExpress)
            Text(String(format: "Cost: $%.2f", cost))
        }
        .padding()
    }
}
