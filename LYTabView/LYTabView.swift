//
//  LYTabView.swift
//  LYTabView
//
//  Created by Lu Yibin on 16/4/13.
//  Copyright © 2016年 Lu Yibin. All rights reserved.
//

import Foundation
import Cocoa

public class LYTabView: NSView {
    public let tabBarView : LYTabBarView
    public let tabView : NSTabView
    let stackView : NSStackView
    
    public var delegate : NSTabViewDelegate? {
        get {
            return tabBarView.delegate
        }
        set(newDelegate) {
            tabBarView.delegate = newDelegate
        }
    }
    
    var numberOfTabViewItems: Int { return self.tabView.numberOfTabViewItems }
    var tabViewItems: [NSTabViewItem] { return self.tabView.tabViewItems }
    var selectedTabViewItem: NSTabViewItem? { return self.tabView.selectedTabViewItem }
    
    func setupViews() {
        tabView.delegate = tabBarView
        tabView.tabViewType = .NoTabsBezelBorder
        tabBarView.tabView = tabView
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        stackView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        stackView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        stackView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true

        
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addView(tabBarView, inGravity: .Center)
        stackView.addView(tabView, inGravity: .Center)
        stackView.orientation = .Vertical
        stackView.distribution = .Fill
        stackView.alignment = .CenterX
        stackView.spacing = 0
        stackView.leadingAnchor.constraintEqualToAnchor(tabBarView.leadingAnchor).active = true
        stackView.trailingAnchor.constraintEqualToAnchor(tabBarView.trailingAnchor).active = true
        
        tabView.setContentHuggingPriority(NSLayoutPriorityDefaultLow-10, forOrientation: .Vertical)
        tabBarView.setContentCompressionResistancePriority(NSLayoutPriorityDefaultHigh, forOrientation: .Vertical)
        tabBarView.setContentHuggingPriority(NSLayoutPriorityDefaultHigh, forOrientation: .Vertical)
    }
    
    required public init?(coder: NSCoder) {
        tabView = NSTabView(coder: coder)!
        tabBarView = LYTabBarView(coder: coder)!
        stackView = NSStackView(frame:.zero)
        super.init(coder: coder)
        setupViews()
    }
    
    required public override init(frame frameRect: NSRect) {
        tabView = NSTabView(frame: .zero)
        tabBarView = LYTabBarView(frame: .zero)
        stackView = NSStackView(frame: frameRect)
        super.init(frame: frameRect)
        setupViews()
    }
}

extension LYTabView {
    func addTabViewItem(tabViewItem: NSTabViewItem) {
        self.tabView.addTabViewItem(tabViewItem)
    }
    
    func insertTabViewItem(tabViewItem: NSTabViewItem, atIndex index: Int) {
        self.tabView.insertTabViewItem(tabViewItem, atIndex: index)
    }
    
    func removeTabViewItem(tabViewItem: NSTabViewItem) {
        self.tabView.removeTabViewItem(tabViewItem)
    }
    
    func indexOfTabViewItem(tabViewItem: NSTabViewItem) -> Int {
        return self.tabView.indexOfTabViewItem(tabViewItem)
    }
    
    func indexOfTabViewItemWithIdentifier(identifier: AnyObject) -> Int {
        return self.tabView.indexOfTabViewItemWithIdentifier(identifier)
    }
    
    func tabViewItemAtIndex(index: Int) -> NSTabViewItem {
        return self.tabView.tabViewItemAtIndex(index)
    }
    
    func selectFirstTabViewItem(sender: AnyObject?) {
        self.tabView.selectFirstTabViewItem(sender)
    }
    
    func selectLastTabViewItem(sender: AnyObject?) {
        self.tabView.selectLastTabViewItem(sender)
    }
    
    func selectNextTabViewItem(sender: AnyObject?) {
        self.tabView.selectNextTabViewItem(sender)
    }
    
    func selectPreviousTabViewItem(sender: AnyObject?) {
        self.tabView.selectPreviousTabViewItem(sender)
    }
    
    func selectTabViewItem(tabViewItem: NSTabViewItem?) {
        self.tabView.selectTabViewItem(tabViewItem)
    }
    
    func selectTabViewItemAtIndex(index: Int) {
        self.tabView.selectTabViewItemAtIndex(index)
    }
    
    func selectTabViewItemWithIdentifier(identifier: AnyObject) {
        self.tabView.selectTabViewItemWithIdentifier(identifier)
    }
    
    func takeSelectedTabViewItemFromSender(sender: AnyObject?) {
        self.tabView.takeSelectedTabViewItemFromSender(sender)
    }
}