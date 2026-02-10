import XCTest
@testable import PatternsIOS

final class StrategyTests: XCTestCase {
    func testExpressIsMoreExpensiveThanStandard() {
        let order = Order(subtotal: 120, distanceKm: 10)
        let standard = StandardShipping()
        let express = ExpressShipping()

        XCTAssertGreaterThan(express.cost(for: order), standard.cost(for: order))
    }
}
