import XCTest
@testable import UniteKit

final class CGSizeExtraTests: XCTestCase {
  
  func testCGSize() {
    let size1 = CGSize(width: 100, height: 100)
    let size2 = CGSize(string: "{100, 100}")
    XCTAssertEqual(size1, size2)
  }
  
}
