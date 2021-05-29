//
//  UKContentMode.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Inspired by: https://github.com/soffes/X

#if os(macOS) || os(watchOS)
public enum UKContentMode : Int {
  case scaleToFill = 0
  case scaleAspectFit
  case scaleAspectFill
  case redraw
  case center
  case top
  case bottom
  case left
  case right
  case topLeft
  case topRight
  case bottomLeft
  case bottomRight
}
#elseif os(iOS) || os(tvOS)
import UIKit.UIView
public typealias UKContentMode = UIView.ContentMode
#endif

extension UKContentMode: CaseIterable {
  public static var allCases: [UKContentMode] =  [.scaleToFill,
                                                  .scaleAspectFit,
                                                  .scaleAspectFill,
                                                  .redraw,
                                                  .center,
                                                  .top,
                                                  .bottom,
                                                  .left,
                                                  .right,
                                                  .topLeft,
                                                  .topRight,
                                                  .bottomLeft,
                                                  .bottomRight]
}
