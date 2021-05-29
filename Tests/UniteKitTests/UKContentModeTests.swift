import XCTest
@testable import UniteKit

final class UKContentModeTests: XCTestCase {
  
  func testContentMode() {
    let allModes = UKContentMode.allCases
    XCTAssertEqual(allModes.count, UKContentMode.bottomRight.rawValue + 1)
  }
  
}
