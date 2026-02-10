import SwiftUI

@MainActor
struct AppConfigView: View {
    // Local UI state mirrors the singleton to allow editing.
    @State private var isNewUIEnabled: Bool = AppConfig.shared.featureFlags["newUI"] ?? false
    @State private var apiBaseURL: String = AppConfig.shared.apiBaseURL.absoluteString

    var body: some View {
        VStack(spacing: 16) {
            Text("Singleton")
                .font(.title2)

            TextField("API Base URL", text: $apiBaseURL)
                .textFieldStyle(.roundedBorder)

            Toggle("New UI Enabled", isOn: $isNewUIEnabled)

            Button("Save") {
                save()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    // Writes the edited values back into the singleton instance.
    private func save() {
        if let url = URL(string: apiBaseURL) {
            AppConfig.shared.apiBaseURL = url
        }
        AppConfig.shared.featureFlags["newUI"] = isNewUIEnabled
    }
}
