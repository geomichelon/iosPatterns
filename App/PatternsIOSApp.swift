import SwiftUI
import PatternsIOS

@main
struct PatternsIOSApp: App {
    var body: some Scene {
        // App entry point shows the catalog of patterns.
        WindowGroup {
            PatternsCatalogView()
        }
    }
}
