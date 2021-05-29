import XCTest
@testable import UniteKit

final class UKColorTests: XCTestCase {
  
  func testRandomColor() {
    let randomColor = UKColor.randomColor()
    XCTAssertNotNil(randomColor)
  }
  
  func testSystemColors() {
    let systemColors = UKColor.systemColors()
    #if os(macOS)
    XCTAssertEqual(systemColors.count, 11)
    #else
    XCTAssertEqual(systemColors.count, 10)
    #endif
  }
}
