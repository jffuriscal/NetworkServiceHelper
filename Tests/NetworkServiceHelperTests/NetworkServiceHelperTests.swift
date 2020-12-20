import XCTest
@testable import NetworkServiceHelper

final class NetworkServiceHelperTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Reachability.shared.isReachable, true)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
