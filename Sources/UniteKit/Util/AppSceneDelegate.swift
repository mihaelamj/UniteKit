//
//  AppSceneDelegate.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

public class AppSceneDelegate {
  #if os(OSX)
  public static func makeWindow_Mac(theVC: UKViewController) -> UKWindow? {
    let size = UKScreen.supposedSize()
    let win = UKWindow(contentRect: NSMakeRect(0, 0, size.width, size.height),
                       styleMask: [.miniaturizable, .closable, .resizable, .titled],
                       backing: .buffered,
                       defer: false)
    win.title = "Many 🍎!"
    win.contentViewController = theVC
    win.makeKeyAndOrderFront(nil)
    
    win.contentView?.makeLikeUIView()
    return win
  }
  #endif
  
  #if os(iOS) || os(tvOS)
  @available(iOS 13.0, *)
  public static func makeWindow_iOS(theScene:UIWindowScene, theVC: UKViewController) -> UKWindow {
    let window = UKWindow(frame: theScene.coordinateSpace.bounds)
    window.windowScene = theScene
    window.rootViewController = theVC
    window.makeKeyAndVisible()
    return window
  }
  #endif
}
