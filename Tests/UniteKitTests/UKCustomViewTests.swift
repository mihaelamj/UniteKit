import XCTest
@testable import UniteKit

final class UKCustomViewTests: XCTestCase {
  
  func testCustomViewIsDefault() {
    
    class MyCustomView: UKCustomView { }
    
    let view = MyCustomView()
    
    XCTAssertEqual(view.viewOptions, UKViewOptions.default)
  }
  
  func testCustomViewIsLikeUIKit() {
    class MyCustomView: UKCustomView {
      override open var viewOptions: UKViewOptions {
        return .uiKitDefault
      }
    }
    
    let view = MyCustomView()
    XCTAssertEqual(view.viewOptions, UKViewOptions.uiKitDefault)
  }
  
  func testCustomViewPlatformDefaults() {
    let view = UKView()
    let options = UKViewOptions(view: view)
    options.describe()
    view.debugLayerInfo()
    
    #if os(iOS) || os(tvOS)
    let diff = options.difference(from: UKViewOptions.uiKitDefault)
    debugPrint("diff: \(diff)")
    XCTAssertEqual(options, UKViewOptions.uiKitDefault)
    #endif
    
    #if os(OSX)
    let diff = options.difference(from: UKViewOptions.appKitDefault)
    debugPrint("diff: \(diff)")
    XCTAssertEqual(options, UKViewOptions.appKitDefault)
    #endif
  }
  
  func testUIKitDefault() {
    class MyCustomView: UKCustomView {
      override open var viewOptions: UKViewOptions {
        return .uiKitDefault
      }
    }
    
    let view = MyCustomView()
    XCTAssertEqual(view.viewOptions, UKViewOptions.uiKitDefault)
    
    XCTAssertTrue(view.wantsLayer)
    #if os(OSX)
    XCTAssertTrue(view.layer != nil)
    #endif
    XCTAssertTrue(view.isFlipped)
    XCTAssertTrue(view.wantsUpdateLayer)
    XCTAssertFalse(view.canDrawSubviewsIntoLayer)
    XCTAssertTrue(view.myLayerContentsRedrawPolicy == .onSetNeedsDisplay)
  }
  
  func testAppKitDefault() {
    class MyCustomView: UKCustomView {
      override open var viewOptions: UKViewOptions {
        return .appKitDefault
      }
    }
    
    let view = MyCustomView()
    XCTAssertEqual(view.viewOptions, UKViewOptions.appKitDefault)
    
    view.debugLayerInfo()
    
    #if os(OSX)
    XCTAssertFalse(view.wantsLayer)
    XCTAssertTrue(view.layer == nil)
    XCTAssertFalse(view.isFlipped)
    #endif
    XCTAssertTrue(view.wantsUpdateLayer)
    XCTAssertFalse(view.canDrawSubviewsIntoLayer)
    XCTAssertTrue(view.myLayerContentsRedrawPolicy == .onSetNeedsDisplay)
  }
  
}
