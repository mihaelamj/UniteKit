//
//  UKView+Layers.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//

#if os(OSX)
import Cocoa

public extension NSView {
  func makeLikeUIView() {
    wantsLayer = true
    layerContentsRedrawPolicy = .onSetNeedsDisplay
  }
}
#endif

public extension UKView {
  func debugLayerInfo() {
    debugPrint("wantsLayer = \(wantsLayer)")
    debugPrint("wantsUpdateLayer = \(wantsUpdateLayer)")
    debugPrint("isFlipped = \(isFlipped)")
    debugPrint("layerContentsRedrawPolicy = \(myLayerContentsRedrawPolicy.toString())")
    debugPrint("\(myLayerContentsRedrawPolicy.explanation())")
  }
}
