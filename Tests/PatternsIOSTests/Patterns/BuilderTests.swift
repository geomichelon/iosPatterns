import XCTest
import Foundation
@testable import PatternsIOS

final class BuilderTests: XCTestCase {
    func testBuilderBuildsRequest() {
        let builder = RequestBuilder()
            .setMethod(.post)
            .setPath("/login")
            .addHeader(name: "Content-Type", value: "application/json")
            .setBody("{}".data(using: .utf8))

        let request = builder.build()

        XCTAssertEqual(request.method, .post)
        XCTAssertEqual(request.path, "/login")
        XCTAssertEqual(request.headers["Content-Type"], "application/json")
        XCTAssertNotNil(request.body)
    }
}
