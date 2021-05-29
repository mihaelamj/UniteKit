//
//  UKImage.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Original Source by: https://github.com/soffes/X

#if os(macOS)
import AppKit.NSImage
public typealias UKImage = NSImage

extension UKImage {
  public var cgImage: CGImage! {
    return cgImage(forProposedRect: nil, context: nil, hints: nil)
  }
  
  public convenience init?(cgImage: CGImage) {
    self.init(cgImage: cgImage, size: .zero)
  }
}
#else
import UIKit.UIImage
public typealias UKImage = UIImage
#endif

#if os(iOS) || os(tvOS)
extension UKImage {
  public static func named(_ name: String, in bundle: Bundle?) -> UKImage? {
    return UKImage(named: name, in: bundle, compatibleWith: nil)
  }
}
#elseif os(macOS)
extension UKImage {
  public static func named(_ name: String, in bundle: Bundle?) -> UKImage? {
    guard let bundle = bundle else {
      return UKImage(named: name)
    }
    
    guard let image = bundle.image(forResource: name) else {
      return nil
    }
    
    image.setName(name)
    return image
  }
}
#endif
