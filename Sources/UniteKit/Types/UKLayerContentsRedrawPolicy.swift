//
//  UKLayerContentsRedrawPolicy.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
public enum UKLayerContentsRedrawPolicy : Int {

    // Leave the layer's contents alone. Never mark the layer as needing display, or draw the view's contents to the layer
    case never = 0

    // Map view -setNeedsDisplay...: activity to the layer, and redraw affected layer parts by invoking the view's -drawRect:, but don't mark the view or layer as needing display when the view's size changes.
    case onSetNeedsDisplay = 1

    // Resize the layer and redraw the view to the layer when the view's size changes. If the resize is animated, AppKit will drive the resize animation itself and will do this resize+redraw at each step of the animation. Affected parts of the layer will also be redrawn when the view is marked as needing display. (This mode is a superset of NSViewLayerContentsRedrawOnSetNeedsDisplay.)
    case duringViewResize = 2

    // Resize the layer and redraw the view to the layer when the view's size changes. This will be done just once at the beginning of a resize animation, not at each frame of the animation. Affected parts of the layer will also be redrawn when the view is marked as needing display. (This mode is a superset of NSViewLayerContentsRedrawOnSetNeedsDisplay.)
    case beforeViewResize = 3

    // When a view is resized, the layer contents will be redrawn once and the contents will crossfade from the old value to the new value. Use this in conjunction with the layerContentsPlacement to get a nice crossfade animation for complex layer-backed views that can't correctly update on each step of the animation
    case crossfade = 4
}
#elseif os(macOS)
import Cocoa
public typealias UKLayerContentsRedrawPolicy = NSView.LayerContentsRedrawPolicy
#endif

public extension UKLayerContentsRedrawPolicy {
  func toString() -> String {
    switch self {
      case .never:
        return "never"
      case .beforeViewResize:
        return "beforeViewResize"
      case .onSetNeedsDisplay:
        return "onSetNeedsDisplay"
      case .duringViewResize:
        return "duringViewResize"
      case .crossfade:
        return "crossfade"
      default:
        return "none"
    }
  }
  
  func explanation() -> String {
    switch self {
      case .never:
        return "Leave the layer's contents alone. Never mark the layer as needing display, or draw the view's contents to the layer. This is how developer created layers (layer-hosting views) are treated."
      case .beforeViewResize:
        return "Resize the layer and redraw the view to the layer when the view's size changes. This will be done just once at the beginning of a resize animation, not at each frame of the animation. Affected parts of the layer will also be redrawn when the view is marked as needing display. This mode is a superset of `NSView.LayerContentsRedrawPolicy.onSetNeedsDisplay`."
      case .onSetNeedsDisplay:
        return "Any of the setNeedsDisplay methods sent to the view will cause the view redraw the affected layer parts by invoking the view's `draw(_:)`, but neither the layer or the view are marked as needing display when the view's size changes."
      case .duringViewResize:
        return "Resize the view’s backing-layer and redraw the view to the layer when the view's size changes. If the resize is animated, AppKit will drive the resize animation itself and will do this resize and redraw at each step of the animation. Affected parts of the layer will also be redrawn when the view is marked as needing display. This mode is a superset of `NSView.LayerContentsRedrawPolicy.onSetNeedsDisplay`. This is the way that layer-backed views are currently treated."
      case .crossfade:
        return "Redraw the layer contents at the new size and crossfade from the old contents to the new contents. Use this in conjunction with the `NSView.LayerContentsPlacement` constants to get a nice crossfade animation for complex layer-backed views that cannot update correctly at each step of the animation."
      default:
        return "none"
    }
  }
}


/**
 
 1. No Layer
 - .never
 
 2. Layer-Hosted
 - .never
 
 3. Layer-Backed
 - .duringViewResize
 
 */
