import XCTest
@testable import PatternsIOS

@MainActor
final class SingletonTests: XCTestCase {
    func testSharedInstanceIsSame() {
        XCTAssertTrue(AppConfig.shared === AppConfig.shared)
    }

    func testResetForTestsClearsFlags() {
        AppConfig.shared.featureFlags["newUI"] = true
        AppConfig.shared.resetForTests()

        XCTAssertNil(AppConfig.shared.featureFlags["newUI"])
    }
}
