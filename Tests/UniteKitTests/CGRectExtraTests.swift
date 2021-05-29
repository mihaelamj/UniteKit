import XCTest
@testable import UniteKit

final class CRectExtraTests: XCTestCase {
  
  func testCGRect() {
    let rect1 = CGRect(x: 10, y: 10, width: 100, height: 100)
    let rectString = rect1.stringRepresentation
    let rect2 = CGRect(string: rectString)
    XCTAssertEqual(rect1, rect2)
  }
  
}
