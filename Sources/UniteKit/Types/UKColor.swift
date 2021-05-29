//
//  UKColor.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Inspired by: https://github.com/soffes/X

#if os(macOS)
import AppKit.NSColor
public typealias UKColor = NSColor

extension NSColor {
  public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
    self.init(srgbRed: red, green: green, blue: blue, alpha: alpha)
  }
}
#else
import UIKit.UIColor
public typealias UKColor = UIColor
#endif


public extension UKColor {
  static func randomColor() -> UKColor {
    let colors = systemColors()
    return colors.randomElement() ?? UKColor.systemBlue
  }
  
  static func systemColors() -> [UKColor] {
    #if os(macOS) // 11
    return [
      UKColor.systemRed,
      UKColor.systemBlue,
      UKColor.systemPink,
      UKColor.systemGray,
      UKColor.systemTeal,
      UKColor.systemBrown,
      UKColor.systemOrange,
      UKColor.systemPurple,
      UKColor.systemYellow,
      UKColor.systemGreen,
      UKColor.systemIndigo
    ]
    #else // 10
    return [
      UKColor.systemRed,
      UKColor.systemBlue,
      UKColor.systemPink,
      UKColor.systemGray,
      UKColor.systemTeal,
      UKColor.systemOrange,
      UKColor.systemPurple,
      UKColor.systemYellow,
      UKColor.systemGreen,
      UKColor.systemIndigo
    ]
    #endif
  }
}
