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
      
      let view = UIView()
      view.backgroundColor = UIColor.redColor()
      self.view.addSubview(view)
      
      view.size(width: 200, height: 100)
      view.alignVertically(self.view)
      view.pin(.Left, toEdge: .Left, ofView: self.view, margin: 20)
    }
  
}

