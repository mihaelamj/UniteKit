import XCTest
@testable import UniteKit

final class CGPointExtraTests: XCTestCase {
  
  func testCGPoint() {
    let point1 = CGPoint(x: 10, y: 10)
    let point2 = CGPoint(string: "{10, 10}")
    XCTAssertEqual(point1, point2)
  }
  
}
