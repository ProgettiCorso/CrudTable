import XCTest
@testable import CrudTable

final class CrudTableTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CrudTable().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
