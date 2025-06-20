import XCTest
@testable import WeChatHelper

final class WeChatHelperTests: XCTestCase {
    func testParserProducesJSON() throws {
        let text = """
# Chapter 1
- Highlight one
> Comment one
- Highlight two
"""
        let chapters = WeChatParser.parse(text: text)
        XCTAssertEqual(chapters.count, 1)
        XCTAssertEqual(chapters.first?.title, "Chapter 1")
        XCTAssertEqual(chapters.first?.highlights.count, 2)
        XCTAssertEqual(chapters.first?.highlights.first?.comment, "Comment one")
    }
}
