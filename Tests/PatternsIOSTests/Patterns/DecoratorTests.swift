import XCTest
@testable import PatternsIOS

final class DecoratorTests: XCTestCase {
    func testDecoratorsAddCostAndIngredients() {
        var drink: any Beverage = SimpleCoffee()
        drink = MilkDecorator(base: drink)
        drink = WhipDecorator(base: drink)

        XCTAssertEqual(drink.cost, 3.2, accuracy: 0.001)
        XCTAssertEqual(drink.ingredients, ["Coffee", "Milk", "Whip"])
    }
}
