import XCTest
@testable import PatternsIOS

final class AdapterTests: XCTestCase {
    func testAdapterForwardsEventToLegacy() {
        let legacy = LegacyAnalytics()
        let adapter = LegacyAnalyticsAdapter(legacy: legacy)
        let event = AnalyticsEvent(name: "signup", attributes: ["source": "test"])

        adapter.track(event)

        XCTAssertEqual(legacy.lastEventName, "signup")
        XCTAssertEqual(legacy.lastMetadata?["source"], "test")
    }
}
