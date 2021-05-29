//
//  OtherUKTypes.swift
//  UniteKit
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//  Original Source by: https://github.com/soffes/X

#if os(iOS) || os(tvOS)
import UIKit

public typealias UKViewController = UIViewController
public typealias UKTableView = UITableView
public typealias UKTableViewDataSource = UITableViewDataSource
public typealias UKTableViewDelegate = UITableViewDelegate
public typealias UKSplitViewController = UISplitViewController
public typealias UKWindow = UIWindow
public typealias UKTableViewCell = UITableViewCell
public typealias UKLayoutGuide = UILayoutGuide
public typealias UKImageView = UIImageView
public typealias CellClassType = UITableViewCell.Type
#endif

#if os(OSX)
import Cocoa

public typealias UKViewController = NSViewController
public typealias UKTableView = NSTableView
public typealias UKTableViewDataSource = NSTableViewDataSource
public typealias UKTableViewDelegate = NSTableViewDelegate
public typealias UKSplitViewController = NSSplitViewController
public typealias UKWindow = NSWindow
public typealias UKImageView = NSImageView
public typealias CellClassType = UKView.Type
@available(macOS 10.11, *)
public typealias UKLayoutGuide = NSLayoutGuide
#endif
