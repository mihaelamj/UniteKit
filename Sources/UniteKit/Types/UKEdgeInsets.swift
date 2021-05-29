//
//  UKEdgeInsets.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Original Source by: https://github.com/soffes/X

import Foundation

#if os(macOS)
import AppKit
public typealias UKEdgeInsets = NSEdgeInsets
#else
import UIKit
public typealias UKEdgeInsets = UIEdgeInsets
#endif

extension UKEdgeInsets {
  #if os(macOS)
  public static let zero = UKEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  #endif
  
  public var flipped: UKEdgeInsets {
    var insets = self
    insets.top = bottom
    insets.bottom = top
    return insets
  }
  
  public func insetRect(rect: CGRect) -> CGRect {
    #if os(macOS)
    if (top + bottom > rect.size.height) || (left + right > rect.size.width) {
      return .null
    }
    
    var insetRect = rect
    insetRect.origin.x += left
    insetRect.origin.y += top;
    insetRect.size.height -= top + bottom
    insetRect.size.width -= left + right
    return insetRect
    #else
    return rect.inset(by: self)
    #endif
  }
}

extension UKEdgeInsets: Equatable {
  public static func == (lhs: UKEdgeInsets, rhs: UKEdgeInsets) -> Bool {
    return
      lhs.left == rhs.left &&
      lhs.right == rhs.right &&
      lhs.top == rhs.top &&
      lhs.bottom == rhs.bottom
  }
}
