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
    
    let views = [ addView(), addView(), addView() ]
    
    UIView.distribute(views, inView: view, alongAxis: .Vertical)
    UIView.size(width: 100, height: 50, ofViews: views)
    UIView.alignHorizontally(ofViews: views, toView: view)
  }
  
  func addView() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor.redColor()
    self.view.addSubview(view)
    return view
  }
  
}

