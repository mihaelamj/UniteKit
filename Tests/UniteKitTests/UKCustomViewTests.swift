import XCTest
@testable import UniteKit

final class UKCustomViewTests: XCTestCase {
  
  func testCustomViewIsDefault() {
    
    class MyCustomView: UKCustomView { }
    
    let view = MyCustomView()
    
    XCTAssertEqual(view.viewOptions, UKViewOptions.default)
  }
  
  func testCustomViewIsDefaultt() {
    
  }
  
}
