import SwiftUI
import Foundation

public struct PatternsCatalogView: View {
    public init() {}

    public var body: some View {
        // Use NavigationStack on iOS 16+, fallback to NavigationView on iOS 15.
        if #available(iOS 16.0, *) {
            NavigationStack {
                content
                    .navigationTitle("Design Patterns")
            }
        } else {
            NavigationView {
                content
                    .navigationTitle("Design Patterns")
            }
        }
    }

    private var content: some View {
        List {
            Section("Creational") {
                NavigationLink("Singleton") {
                    AppConfigView()
                }
                NavigationLink("Factory Method") {
                    FactoryMethodView(factory: CircleBadgeFactory())
                }
                NavigationLink("Builder") {
                    // Build a sample request to display in the view.
                    let request = RequestBuilder()
                        .setMethod(.post)
                        .setPath("/login")
                        .addHeader(name: "Content-Type", value: "application/json")
                        .setBody("{}".data(using: .utf8))
                        .build()
                    RequestPreviewView(request: request)
                }
            }

            Section("Behavioral") {
                NavigationLink("Observer") {
                    WeatherStationView(station: WeatherStation())
                }
                NavigationLink("Strategy") {
                    ShippingOptionsView(order: Order(subtotal: 120, distanceKm: 8))
                }
            }

            Section("Structural") {
                NavigationLink("Decorator") {
                    CoffeeOrderView()
                }
                NavigationLink("Adapter") {
                    AnalyticsDebugView()
                }
            }
        }
    }
}
