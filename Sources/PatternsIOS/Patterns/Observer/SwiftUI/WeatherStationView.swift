import SwiftUI
import Foundation

// View-model acts as an observer and bridges updates to SwiftUI.
final class WeatherViewModel: ObservableObject, WeatherObserver {
    @Published var temperatureText: String = "--"

    private let station: WeatherStation
    private var observerId: UUID?

    init(station: WeatherStation) {
        self.station = station
        // Register as an observer on initialization.
        observerId = station.addObserver(self)
    }

    deinit {
        // Cleanup the observer token on deallocation.
        if let observerId {
            station.removeObserver(observerId)
        }
    }

    func weatherDidUpdate(_ temperature: Double) {
        // Observer callback updates published state for the UI.
        temperatureText = String(format: "%.1f C", temperature)
    }

    func refresh() {
        // Simulate a new reading.
        station.updateTemperature(Double.random(in: 18...32))
    }
}

struct WeatherStationView: View {
    // The view owns the view-model and keeps it alive.
    @StateObject private var viewModel: WeatherViewModel

    init(station: WeatherStation) {
        _viewModel = StateObject(wrappedValue: WeatherViewModel(station: station))
    }

    var body: some View {
        VStack(spacing: 12) {
            Text("Observer")
                .font(.title2)
            Text("Temperature: \(viewModel.temperatureText)")
            Button("Refresh") {
                viewModel.refresh()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
