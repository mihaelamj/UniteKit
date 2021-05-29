//
//  UKViewOptions.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//

/**
 `Like UIKit`
 
 wantsLayer = true
 wantsUpdateLayer = true
 isFlipped = true
 canDrawSubviewsIntoLayer = false
 layerContentsRedrawPolicy = .onSetNeedsDisplay
 */

public struct UKViewOptions: OptionSet {
  
  // MARK: -
  // MARK: Instance Properties -
  
  public let rawValue: Int
  public typealias RawValue = Int
  
  // MARK: -
  // MARK: Init -
  
  public init(rawValue: UKViewOptions.RawValue) {
      self.rawValue = rawValue
  }
  
  public init(view: UKView) {
    var result = UKViewOptions(rawValue: 0)
    
    if view.wantsLayer {
      result.insert(.wantsLayer)
    }
    
    if view.isFlipped {
      result.insert(.isFlipped)
    }
    
    if view.wantsUpdateLayer {
      result.insert(.wantsUpdateLayer)
    }
    
    if view.canDrawSubviewsIntoLayer {
      result.insert(.canDrawSubviewsIntoLayer)
    }
    
    if view.myLayerContentsRedrawPolicy == .onSetNeedsDisplay {
      result.insert(.redrawOnSetNeedsDisplay)
    } else if view.myLayerContentsRedrawPolicy == .duringViewResize {
      result.insert(.redrawDuringViewResize)
    }
    
    self = result
  }
  
  // MARK: -
  // MARK: Static Single Options -
  
  public static let wantsLayer = UKViewOptions(rawValue: 1 << 0)
  
  /// You must also override the `updateLayer()` method of your view and use it to make the changes to your layer.
  /// When using the `updateLayer()` method to update your view, it is recommended that you set the view’s redraw policy to `NSView.LayerContentsRedrawPolicy.onSetNeedsDisplay`. This policy lets you control when you want to update the layer’s contents.
  public static let wantsUpdateLayer = UKViewOptions(rawValue: 1 << 1)
  
  public static let isFlipped = UKViewOptions(rawValue: 1 << 2)
  
  /// If the `canDrawSubviewsIntoLayer` property is set to true, the view ignores the value returned by `wantsUpdateLayer`.
  /// Instead, the view always uses its `draw(_:)` method to draw its content.
  public static let canDrawSubviewsIntoLayer = UKViewOptions(rawValue: 1 << 3) // for using `drawRect`
  
  public static let redrawOnSetNeedsDisplay = UKViewOptions(rawValue: 1 << 4)
  public static let redrawDuringViewResize = UKViewOptions(rawValue: 1 << 5)
  
  // MARK: -
  // MARK: Static Compound Options -
  
  public static let `default`: UKViewOptions  = [.wantsLayer]
  #if os(OSX)
  public static let onlyDrawRect: UKViewOptions  = [.canDrawSubviewsIntoLayer, .redrawOnSetNeedsDisplay]
  #endif
  #if os(iOS) || os(tvOS)
  public static let onlyDrawRect: UKViewOptions  = [.wantsLayer, .wantsUpdateLayer,.isFlipped, .canDrawSubviewsIntoLayer, .redrawOnSetNeedsDisplay]
  #endif
  public static let all: UKViewOptions = [.wantsLayer, .wantsUpdateLayer, .isFlipped, .canDrawSubviewsIntoLayer, redrawOnSetNeedsDisplay]
  
  public static let appKitDefault: UKViewOptions = [.wantsUpdateLayer, .redrawOnSetNeedsDisplay]
  public static let uiKitDefault: UKViewOptions = [.wantsLayer, .wantsUpdateLayer, isFlipped, .redrawOnSetNeedsDisplay]
  
  // MARK: -
  // MARK: Methods -
  
  public func describe() {
    debugPrint("wantsLayer = \(contains(.wantsLayer))")
    debugPrint("wantsUpdateLayer = \(contains(.wantsUpdateLayer))")
    debugPrint("isFlipped = \(contains(.isFlipped))")
    debugPrint("canDrawSubviewsIntoLayer= \(contains(.canDrawSubviewsIntoLayer))")
    debugPrint("redrawOnSetNeedsDisplay = \(contains(.redrawDuringViewResize))")
    debugPrint("redrawDuringViewResize= \(contains(.redrawDuringViewResize))")
  }
  
  public func isAppledOnView(_ view: UKView) -> Bool {
    let options = UKViewOptions(view: view)
    return options.rawValue == self.rawValue
  }
  
  func difference(from: UKViewOptions) -> [String] {
    guard self != from else { return []}
    var result = [String]()
    
    // wantsLayer
    if contains(.wantsLayer) && !from.contains(.wantsLayer) {
      result.append("- wantsLayer")
    }
    if !contains(.wantsLayer) && from.contains(.wantsLayer) {
      result.append("+ wantsLayer")
    }
    
    // wantsUpdateLayer
    if contains(.wantsUpdateLayer) && !from.contains(.wantsUpdateLayer) {
      result.append("- wantsUpdateLayer")
    }
    if !contains(.wantsUpdateLayer) && from.contains(.wantsUpdateLayer) {
      result.append("+ wantsUpdateLayer")
    }
    
    // isFlipped
    if contains(.isFlipped) && !from.contains(.isFlipped) {
      result.append("- isFlipped")
    }
    if !contains(.isFlipped) && from.contains(.isFlipped) {
      result.append("+ isFlipped")
    }
    
    // redrawOnSetNeedsDisplay
    if contains(.redrawOnSetNeedsDisplay) && !from.contains(.redrawOnSetNeedsDisplay) {
      result.append("- redrawOnSetNeedsDisplay")
    }
    if !contains(.redrawOnSetNeedsDisplay) && from.contains(.redrawOnSetNeedsDisplay) {
      result.append("+ redrawOnSetNeedsDisplay")
    }
    
    // redrawDuringViewResize
    if contains(.redrawDuringViewResize) && !from.contains(.redrawDuringViewResize) {
      result.append("- redrawDuringViewResize")
    }
    if !contains(.redrawDuringViewResize) && from.contains(.redrawDuringViewResize) {
      result.append("+ redrawDuringViewResize")
    }
    
    return result
  }
}

extension UKViewOptions: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "[\(rawValue)], wantsLayer = \(contains(.wantsLayer)), wantsUpdateLayer = \(contains(.wantsUpdateLayer)), isFlipped = \(contains(.isFlipped)), canDrawSubviewsIntoLayer= \(contains(.canDrawSubviewsIntoLayer)), redrawOnSetNeedsDisplay= \(contains(.redrawDuringViewResize)), redrawDuringViewResize= \(contains(.redrawDuringViewResize))"
  }
  public var description: String {
    return debugDescription
  }
}


//  macOS, default for UKView
//
//  "wantsLayer = false"
//  "wantsUpdateLayer = true"
//  "isFlipped = false"
//  "canDrawSubviewsIntoLayer= false"
//  "layerContentsRedrawPolicy== .onSetNeedsDisplay = true"
//
//  iOS, default for UKView
//
//  "wantsLayer = true"
//  "wantsUpdateLayer = true"
//  "isFlipped = true"
//  "canDrawSubviewsIntoLayer= false"
//  "layerContentsRedrawPolicy== .onSetNeedsDisplay = true"

