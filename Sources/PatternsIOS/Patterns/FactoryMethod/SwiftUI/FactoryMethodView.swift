import SwiftUI
import Foundation

struct FactoryMethodView: View {
    // Inject the factory so the view is decoupled from concrete products.
    let factory: any BadgeFactory

    var body: some View {
        // The view only knows the factory interface.
        let badge = factory.makeBadge()
        return VStack(spacing: 12) {
            Text("Factory Method")
                .font(.title2)
            Text("Badge: \(badge.name)")
            Text(String(format: "Area: %.2f", badge.area()))
        }
        .padding()
    }
}
