import SwiftUI
import Foundation

struct CoffeeOrderView: View {
    @State private var addMilk: Bool = false
    @State private var addWhip: Bool = false

    private var beverage: any Beverage {
        // Start with the base component and wrap it with decorators.
        var drink: any Beverage = SimpleCoffee()
        if addMilk {
            drink = MilkDecorator(base: drink)
        }
        if addWhip {
            drink = WhipDecorator(base: drink)
        }
        return drink
    }

    var body: some View {
        VStack(spacing: 12) {
            Text("Decorator")
                .font(.title2)
            Toggle("Add Milk", isOn: $addMilk)
            Toggle("Add Whip", isOn: $addWhip)
            Text(String(format: "Cost: $%.2f", beverage.cost))
            Text("Ingredients: \(beverage.ingredients.joined(separator: ", "))")
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
