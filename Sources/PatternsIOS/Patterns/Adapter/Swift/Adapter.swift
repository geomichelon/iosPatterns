import Foundation

// Target interface used by new code.
struct AnalyticsEvent {
    let name: String
    let attributes: [String: String]
}

protocol Analytics {
    func track(_ event: AnalyticsEvent)
}

// Legacy API with a different interface.
final class LegacyAnalytics {
    private(set) var lastEventName: String?
    private(set) var lastMetadata: [String: String]?

    func track(eventName: String, metadata: [String: String]) {
        lastEventName = eventName
        lastMetadata = metadata
    }
}

// Adapter that converts the new interface into the legacy one.
final class LegacyAnalyticsAdapter: Analytics {
    private let legacy: LegacyAnalytics

    init(legacy: LegacyAnalytics) {
        self.legacy = legacy
    }

    func track(_ event: AnalyticsEvent) {
        legacy.track(eventName: event.name, metadata: event.attributes)
    }
}
