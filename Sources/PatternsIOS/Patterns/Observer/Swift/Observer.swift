import Foundation

// Observer protocol used by listeners.
protocol WeatherObserver: AnyObject {
    func weatherDidUpdate(_ temperature: Double)
}

// Subject that keeps a list of observers and notifies them.
final class WeatherStation {
    private struct ObserverEntry {
        weak var observer: (any WeatherObserver)?
    }

    private var observers: [UUID: ObserverEntry] = [:]
    private(set) var temperature: Double = 0

    // Register an observer and return its token.
    func addObserver(_ observer: any WeatherObserver) -> UUID {
        let id = UUID()
        observers[id] = ObserverEntry(observer: observer)
        return id
    }

    // Remove a previously registered observer.
    func removeObserver(_ id: UUID) {
        observers[id] = nil
    }

    // Update state and broadcast to observers.
    func updateTemperature(_ temperature: Double) {
        self.temperature = temperature
        notify(temperature)
    }

    // Notify all observers, dropping deallocated ones.
    private func notify(_ temperature: Double) {
        for (id, entry) in observers {
            if let observer = entry.observer {
                observer.weatherDidUpdate(temperature)
            } else {
                observers[id] = nil
            }
        }
    }
}
