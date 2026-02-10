import SwiftUI

// View-model uses the adapter to keep the UI decoupled from the legacy API.
final class AnalyticsViewModel: ObservableObject {
    @Published var lastEvent: String = "None"

    private let legacy = LegacyAnalytics()
    private lazy var adapter = LegacyAnalyticsAdapter(legacy: legacy)

    func trackSample() {
        // Build a new-style event and forward via the adapter.
        let event = AnalyticsEvent(name: "purchase", attributes: ["value": "9.99"])
        adapter.track(event)
        lastEvent = legacy.lastEventName ?? "None"
    }
}

struct AnalyticsDebugView: View {
    @StateObject private var viewModel = AnalyticsViewModel()

    var body: some View {
        VStack(spacing: 12) {
            Text("Adapter")
                .font(.title2)
            Text("Last event: \(viewModel.lastEvent)")
            Button("Track Sample") {
                viewModel.trackSample()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
