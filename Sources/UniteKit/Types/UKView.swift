//
//  UKView.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Original Source by: https://github.com/soffes/X

#if os(iOS) || os(tvOS)
import UIKit.UIView
public typealias ViewType = UIView
#elseif os(macOS)
import AppKit.NSView
public typealias ViewType = NSView
#endif

#if os(iOS) || os(tvOS) || os(macOS)
open class UKView: ViewType {
  
  public var forcedLayer: CALayer {
    #if os(iOS) || os(tvOS)
    return layer
    #endif
    
    #if os(OSX)
    guard let aLayer = layer else {
      fatalError("Layer == `nil`")
    }
    return aLayer
    #endif
  }
  
  public var myColor: UKColor? {
    set {
      #if os(iOS) || os(tvOS)
      backgroundColor = newValue
      #endif
      
      #if os(OSX)
      layer?.backgroundColor = newValue?.cgColor
      #endif
    }
    get {
      #if os(iOS) || os(tvOS)
      return backgroundColor
      #endif
      
      #if os(OSX)
      guard let aCgColor = layer?.backgroundColor else { return nil }
      return NSColor(cgColor: aCgColor)
      #endif
    }
  }
  
  #if os(macOS)
  open var userInteractionEnabled: Bool {
    return true
  }
  
  open override func viewDidMoveToWindow() {
    didMoveToWindow()
  }
  
  open func didMoveToWindow() {
    super.viewDidMoveToWindow()
  }
  
  open override func viewDidMoveToSuperview() {
    didMoveToSuperview()
  }
  
  open func didMoveToSuperview() {
    super.viewDidMoveToSuperview()
  }
  
  open override func layout() {
    layoutSubviews()
  }
  
  open func layoutSubviews() {
    super.layout()
  }
  
  public var myLayerContentsRedrawPolicy: UKLayerContentsRedrawPolicy {
    return layerContentsRedrawPolicy
  }
  #else
  open var wantsLayer: Bool {
    set { }
    get { return true }
  }
  
  open var wantsUpdateLayer: Bool {
    set { }
    get { return true }
  }
  
  open var isFlipped: Bool {
    set { }
    get { return true }
  }
  
  open var canDrawSubviewsIntoLayer: Bool {
    set { }
    get { return false }
  }
  
  public var myLayerContentsRedrawPolicy: UKLayerContentsRedrawPolicy {
    return .onSetNeedsDisplay
  }
  #endif
}
#endif

public extension UKView {
  func readableRect() -> CGRect {
    #if os(iOS) || os(tvOS)
    return readableContentGuide.layoutFrame
    #endif
    #if os(OSX)
    return bounds
    #endif
  }
  
  func safeAreaRect() -> CGRect {
    #if os(iOS) || os(tvOS)
    return safeAreaLayoutGuide.layoutFrame
    #endif
    #if os(OSX)
    return bounds
    #endif
  }
}
