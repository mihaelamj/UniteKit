import XCTest
@testable import UniteKit

final class UKEdgeInstesModeTests: XCTestCase {
  
  func testFlipped() {
    let insets = UKEdgeInsets(top: 0, left: 0, bottom: 100, right: 100)
    let flipped = UKEdgeInsets(top: 100, left: 0, bottom: 0, right: 100)
    XCTAssertEqual(insets.flipped, flipped)
  }
  
}
