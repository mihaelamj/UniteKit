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
 layerContentsRedrawPolicy = .onSetNeedsDisplay
 */

public struct UKViewOptions: OptionSet {
  public let rawValue: Int
  public typealias RawValue = Int
  
  public init(rawValue: UKViewOptions.RawValue) {
      self.rawValue = rawValue
  }
  
  public static let wantsLayer = UKViewOptions(rawValue: 1 << 0)
  public static let wantsUpdateLayer = UKViewOptions(rawValue: 1 << 1)
  public static let isFlipped = UKViewOptions(rawValue: 1 << 2)
  
  // If the canDrawSubviewsIntoLayer property is set to true, the view ignores the value returned by this method.
  // Instead, the view always uses its draw(_:) method to draw its content.
  public static let canDrawSubviewsIntoLayer = UKViewOptions(rawValue: 1 << 3) // for using `drawRect`
  
  public static let contentsRedrawPolicyIsOnSetNeedsDisplay = UKViewOptions(rawValue: 1 << 4)
  
  public static let likeUIKit: UKViewOptions  = [.wantsLayer, .wantsUpdateLayer, .isFlipped, .contentsRedrawPolicyIsOnSetNeedsDisplay]
  public static let `default`: UKViewOptions  = [.wantsLayer]
  public static let onlyDrawRect: UKViewOptions  = [.canDrawSubviewsIntoLayer]
  public static let all: UKViewOptions = [.wantsLayer, .wantsUpdateLayer, .isFlipped, .canDrawSubviewsIntoLayer, contentsRedrawPolicyIsOnSetNeedsDisplay]
}
