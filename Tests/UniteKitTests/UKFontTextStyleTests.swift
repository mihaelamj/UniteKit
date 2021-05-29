import XCTest
@testable import UniteKit

final class UKFontTextStyleTests: XCTestCase {
  
  func testTextStyles() {
    let allCases = UKFontTextStyle.allCases
    XCTAssertEqual(allCases.count, 10)
  }
  
}
