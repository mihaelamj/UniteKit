//
//  CGPoint+Extra.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Original Source by: https://github.com/soffes/X

import Foundation
import CoreGraphics

#if os(macOS)
public func NSStringFromCGPoint(_ point: CGPoint) -> String! {
  return NSStringFromPoint(point)
}

public func CGPointFromString(_ string: String!) -> CGPoint {
  return NSPointFromString(string) as CGPoint
}
#else
import UIKit
#endif


extension CGPoint {
  public var stringRepresentation: String {
    #if os(macOS)
    return NSStringFromCGPoint(self)
    #else
    return NSCoder.string(for: self)
    #endif
  }
  
  public init(string: String) {
    #if os(macOS)
    self = CGPointFromString(string)
    #else
    self = NSCoder.cgPoint(for: string)
    #endif
  }
}
