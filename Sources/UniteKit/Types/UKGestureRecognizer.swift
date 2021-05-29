//
//  UKGestureRecognizer.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Original Source by: https://github.com/soffes/X

#if os(iOS) || os(tvOS)
import UIKit.UIGestureRecognizer
public typealias UKGestureRecognizer = UIGestureRecognizer
public typealias UKTapGestureRecognizer = UITapGestureRecognizer
public typealias UKPanGestureRecognizer = UIPanGestureRecognizer

#elseif os(macOS)
import AppKit.NSGestureRecognizer
@available(OSX 10.10, *) public typealias UKGestureRecognizer = NSGestureRecognizer
@available(OSX 10.10, *) public typealias UKTapGestureRecognizer = NSClickGestureRecognizer
@available(OSX 10.10, *) public typealias UKPanGestureRecognizer = NSPanGestureRecognizer
#endif
