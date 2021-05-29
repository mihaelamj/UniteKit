//
//  UKFontTextStyle.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Original Source by: https://github.com/soffes/X

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
public typealias UKFontTextStyle = UIFont.TextStyle
#elseif os(macOS)
import AppKit

public enum UKFontTextStyle: String {
  case title1
  case title2
  case title3
  case headline
  case subheadline
  case body
  case footnote
  case caption1
  case caption2
  case callout
  
  public var fontWeight: UKFontWeight {
    switch self {
      case .title1: return .light
      case .headline: return .semibold
      default: return .regular
    }
  }
  
  public var pointSize: CGFloat {
    switch self {
      case .title1: return 28
      case .title2: return 22
      case .title3: return 20
      case .headline: return 17
      case .subheadline: return 15
      case .body: return 17
      case .footnote: return 13
      case .caption1: return 12
      case .caption2: return 11
      case .callout: return 16
    }
  }
}
#endif

extension UKFontTextStyle: CaseIterable {
  public static var allCases: [UKFontTextStyle] =  [.title1,
                                                    .title2,
                                                    .title3,
                                                    .headline,
                                                    .subheadline,
                                                    .body,
                                                    .footnote,
                                                    .caption1,
                                                    .caption2,
                                                    .callout
  ]
}
