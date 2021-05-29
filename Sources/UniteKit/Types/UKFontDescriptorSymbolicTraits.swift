//
//  UKFontDescriptorSymbolicTraits.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Original Source by: https://github.com/soffes/X

import Foundation

#if os(macOS)
import AppKit

public struct UKFontDescriptorSymbolicTraits: OptionSet {
  public let rawValue: Int32
  
  public init(rawValue: Int32) {
    self.rawValue = rawValue
  }
  
  public init(rawValue: Int) {
    self.rawValue = Int32(rawValue)
  }
  
  public init(symbolicTraits: NSFontSymbolicTraits) {
    var traits = UKFontDescriptorSymbolicTraits()
    
    if symbolicTraits & UInt32(NSFontItalicTrait) == UInt32(NSFontItalicTrait) {
      traits.insert(.traitItalic)
    }
    
    if symbolicTraits & UInt32(NSFontBoldTrait) == UInt32(NSFontBoldTrait) {
      traits.insert(.traitBold)
    }
    
    if symbolicTraits & UInt32(NSFontExpandedTrait) == UInt32(NSFontExpandedTrait) {
      traits.insert(.traitExpanded)
    }
    
    if symbolicTraits & UInt32(NSFontCondensedTrait) == UInt32(NSFontCondensedTrait) {
      traits.insert(.traitCondensed)
    }
    
    if symbolicTraits & UInt32(NSFontMonoSpaceTrait) == UInt32(NSFontMonoSpaceTrait) {
      traits.insert(.traitMonoSpace)
    }
    
    if symbolicTraits & UInt32(NSFontVerticalTrait) == UInt32(NSFontVerticalTrait) {
      traits.insert(.traitVertical)
    }
    
    if symbolicTraits & UInt32(NSFontUIOptimizedTrait) == UInt32(NSFontUIOptimizedTrait) {
      traits.insert(.traitUIOptimized)
    }
    
    self = traits
  }
  
  public static let traitItalic = UKFontDescriptorSymbolicTraits(rawValue: NSFontItalicTrait)
  public static let traitBold = UKFontDescriptorSymbolicTraits(rawValue: NSFontBoldTrait)
  public static let traitExpanded = UKFontDescriptorSymbolicTraits(rawValue: NSFontExpandedTrait)
  public static let traitCondensed = UKFontDescriptorSymbolicTraits(rawValue: NSFontCondensedTrait)
  public static let traitMonoSpace = UKFontDescriptorSymbolicTraits(rawValue: NSFontMonoSpaceTrait)
  public static let traitVertical = UKFontDescriptorSymbolicTraits(rawValue: NSFontVerticalTrait)
  public static let traitUIOptimized = UKFontDescriptorSymbolicTraits(rawValue: NSFontUIOptimizedTrait)
  
  public var symbolicTraits: NSFontSymbolicTraits {
    var symbolicTraits: NSFontSymbolicTraits = 0
    
    if contains(.traitItalic) {
      symbolicTraits ^= UInt32(NSFontItalicTrait)
    }
    
    if contains(.traitBold) {
      symbolicTraits ^= UInt32(NSFontBoldTrait)
    }
    
    if contains(.traitExpanded) {
      symbolicTraits ^= UInt32(NSFontExpandedTrait)
    }
    
    if contains(.traitCondensed) {
      symbolicTraits ^= UInt32(NSFontCondensedTrait)
    }
    
    if contains(.traitMonoSpace) {
      symbolicTraits ^= UInt32(NSFontMonoSpaceTrait)
    }
    
    if contains(.traitVertical) {
      symbolicTraits ^= UInt32(NSFontVerticalTrait)
    }
    
    if contains(.traitUIOptimized) {
      symbolicTraits ^= UInt32(NSFontUIOptimizedTrait)
    }
    
    return symbolicTraits
  }
}
#else
import UIKit
public typealias UKFontDescriptorSymbolicTraits = UIFontDescriptor.SymbolicTraits
#endif
