import Foundation

// Singleton that keeps shared configuration for the app.
@MainActor
final class AppConfig {
    // Global shared instance.
    static let shared = AppConfig()

    // Prevent external construction.
    private init() {}

    // Example mutable state owned by the singleton.
    var apiBaseURL: URL = URL(string: "https://example.com")!
    var featureFlags: [String: Bool] = [:]

    // Convenience reset used by tests.
    func resetForTests() {
        apiBaseURL = URL(string: "https://example.com")!
        featureFlags = [:]
    }
}
