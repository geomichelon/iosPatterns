import XCTest
@testable import PatternsIOS

final class ObserverTests: XCTestCase {
    private final class TestObserver: WeatherObserver {
        var lastTemperature: Double?

        func weatherDidUpdate(_ temperature: Double) {
            lastTemperature = temperature
        }
    }

    func testObserverReceivesUpdates() {
        let station = WeatherStation()
        let observer = TestObserver()
        _ = station.addObserver(observer)

        station.updateTemperature(25)

        XCTAssertEqual(observer.lastTemperature, 25)
    }
}
