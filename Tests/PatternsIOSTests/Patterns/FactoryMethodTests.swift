import XCTest
@testable import PatternsIOS

final class FactoryMethodTests: XCTestCase {
    func testCircleFactoryCreatesCircleBadge() {
        let factory = CircleBadgeFactory()
        let badge = factory.makeBadge()

        XCTAssertTrue(badge is CircleBadge)
        XCTAssertEqual(badge.name, "Circle")
    }

    func testSquareFactoryArea() {
        let factory = SquareBadgeFactory()
        let badge = factory.makeBadge()

        XCTAssertTrue(badge is SquareBadge)
        XCTAssertEqual(badge.area(), 144, accuracy: 0.001)
    }
}
