//
//  ViewController.swift
//  SwiftLayout-OSX
//
//  Created by Shaps Mohsenin on 01/04/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Cocoa
//import SwiftLayout

class ViewController: NSViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let views = [ addView(), addView(), addView() ]
    
//    NSView.distribute(views, inView: view, alongAxis: .Vertical)
//    NSView.size(width: 100, height: 50, ofViews: views)
//    NSView.alignHorizontally(ofViews: views, toView: view)
    
    print(views)
  }
  
  func addView() -> NSView {
    let view = NSView()
    view.wantsLayer = true
    view.layer?.backgroundColor = NSColor.redColor().CGColor
    self.view.addSubview(view)
    return view
  }
  
}
