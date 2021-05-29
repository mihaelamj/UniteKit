//
//  UKScreen.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Original Source by: https://github.com/soffes/X

#if os(iOS) || os(tvOS)
import UIKit.UIScreen
public typealias UKScreen = UIScreen
#elseif os(macOS)
import AppKit.NSScreen
public typealias UKScreen = NSScreen

extension NSScreen {
  public var scale: CGFloat {
    return backingScaleFactor
  }
}
#endif

public extension UKScreen {
  static func supposedSize() -> CGSize {
    #if os(iOS) || os(tvOS)
    return UKScreen.main.bounds.size
    #endif
    
    #if os(OSX)
    return UKScreen.main?.visibleFrame.size ?? CGSize(width: 500.0, height: 500.0)
    #endif
  }
}
