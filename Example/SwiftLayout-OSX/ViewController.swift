//
//  ViewController.swift
//  SwiftLayout-OSX
//
//  Created by Shaps Mohsenin on 01/04/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Cocoa
import SwiftLayout

class ViewController: NSViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let views = [ addView(), addView(), addView() ]
    var constraints = [NSLayoutConstraint]()
    
    constraints.append(contentsOf: views.distribute(along: .vertical, in: view))
    
    constraints.append(contentsOf: views.size(width: 100, height: 50))
    constraints.append(contentsOf: views.align(axis: .horizontal, to: view))
    
    constraints.activateConstraints(activate: true)
  }
  
  func addView() -> NSView {
    let view = NSView()
    view.wantsLayer = true
    view.layer?.backgroundColor = NSColor.red().cgColor
    self.view.addSubview(view)
    return view
  }
  
}

