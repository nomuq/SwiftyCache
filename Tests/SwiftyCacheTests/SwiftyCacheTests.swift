@testable import SwiftyCache
import XCTest

final class SwiftyCacheTests: XCTestCase {
    func testText() {
        SwiftyCache.standard["test"] = "Hello, World!"
        XCTAssertEqual(SwiftyCache.standard["test"], "Hello, World!")
        Cache["test2"] = "Hello, World!"
        XCTAssertEqual(Cache["test2"], "Hello, World!")
    }

    static var allTests = [
        ("testText", testText),
    ]
}
