//
//  ViewController.swift
//  SwiftLayout
//
//  Created by Shaps Mohsenin on 01/22/2016.
//  Copyright (c) 2016 Shaps Mohsenin. All rights reserved.
//

import UIKit
import SwiftLayout

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let first = addView()
    
    let views = [ first, addView(), addView() ]

    views.distribute(along: .vertical, in: view)
    views.align(axis: .horizontal, to: view)
    views.size(width: 100, height: 50)
    
    let test = UIView()
    view.addSubview(test)
    
    test.pin(edge: .left, to: .right, of: first, margin: 10)
    test.align(axis: .vertical, to: first)
    test.size(width: 20, height: 100)
    test.backgroundColor = UIColor.gray
  }
  
  func addView() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor.red
    self.view.addSubview(view)
    return view
  }
  
}

