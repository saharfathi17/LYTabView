//
//  ViewController.swift
//  LYTabBarView Demo
//
//  Created by Lu Yibin on 16/3/29.
//  Copyright © 2016年 Lu Yibin. All rights reserved.
//

import Cocoa
import LYTabView

class ViewController: NSViewController {

    @IBOutlet weak var tabView: LYTabView!
   var tabBarView: LYTabBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarView = tabView.tabBarView
        addViewWithLabel("Tab")
        addViewWithLabel("View")

        self.tabBarView.addNewTabButtonTarget = self
        self.tabBarView.addNewTabButtonAction = #selector(addNewTab)
    }
    
    override func viewWillAppear() {
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func addViewWithLabel(label:String) {
        let item = NSTabViewItem()
        item.label = label
        if let labelViewController = self.storyboard?.instantiateControllerWithIdentifier("labelViewController") {
            labelViewController.setTitle(label)
            item.view = labelViewController.view
        }

        self.tabBarView.addTabViewItem(item, animated: true)
    }
    
    @IBAction func toggleAddNewTabButton(sender:AnyObject?) {
        tabBarView.showAddNewTabButton = !tabBarView.showAddNewTabButton
    }
    
    @IBAction func addNewTab(sender:AnyObject?) {
        let count = self.tabBarView.tabViewItems.count
        let label = "Untitled \(count)"
        addViewWithLabel(label)
    }
    
    @IBAction func performCloseTab(sender:AnyObject?) {
        if tabBarView.tabViewItems.count > 1 {
            tabBarView.closeCurrentTab(sender)
        } else {
            self.view.window?.performClose(sender)
        }
    }
    
    @IBAction func toggleTitleBar(sender: AnyObject?) {
        if let window = self.view.window {
            if window.titlebarAppearsTransparent {
                window.titlebarAppearsTransparent = false
                window.titleVisibility = .Visible
                window.styleMask = window.styleMask & (~NSFullSizeContentViewWindowMask)
            }
            else
            {
                window.titlebarAppearsTransparent = true
                window.titleVisibility = .Hidden
                window.styleMask |= NSFullSizeContentViewWindowMask
            }
        }
    }
    
    @IBAction func toggleBorder(sender: AnyObject?) {
        tabBarView.hasBorder = !tabBarView.hasBorder
    }
}

