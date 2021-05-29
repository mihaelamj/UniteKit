//
//  UKFont.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Original Source by: https://github.com/soffes/X

#if os(macOS)
import AppKit.NSFont
public typealias UKFont = NSFont

extension UKFont {
  public var symbolicTraits: UKFontDescriptorSymbolicTraits {
    return UKFontDescriptorSymbolicTraits(symbolicTraits: fontDescriptor.symbolicTraits.rawValue)
  }
}
#else
import UIKit.UIFont
public typealias UKFont = UIFont

extension UKFont {
  public var symbolicTraits: UKFontDescriptorSymbolicTraits {
    return fontDescriptor.symbolicTraits
  }
}
#endif


extension UKFont {
  public var fontWithMonospacedNumbers: UKFont {
    #if os(macOS)
    let fontDescriptor = self.fontDescriptor.addingAttributes([
      NSFontDescriptor.AttributeName.featureSettings: [
        [
          NSFontDescriptor.FeatureKey.typeIdentifier: kNumberSpacingType,
          NSFontDescriptor.FeatureKey.selectorIdentifier: kMonospacedNumbersSelector
        ]
      ]
    ])
    return UKFont(descriptor: fontDescriptor, size: pointSize) ?? self
    #elseif os(watchOS)
    let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
      UIFontDescriptor.AttributeName.featureSettings: [
        [
          UIFontDescriptor.FeatureKey.featureIdentifier: 6,
          UIFontDescriptor.FeatureKey.typeIdentifier: 0
        ]
      ]
    ])
    return UKFont(descriptor: fontDescriptor, size: pointSize)
    #else
    let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
      UIFontDescriptor.AttributeName.featureSettings: [
        [
          UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
          UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector
        ]
      ]
    ])
    return UKFont(descriptor: fontDescriptor, size: pointSize)
    #endif
  }
}
