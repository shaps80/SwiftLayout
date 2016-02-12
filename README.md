# SwiftLayout

[![Version](https://img.shields.io/cocoapods/v/SwiftLayout.svg?style=flat)](http://cocoapods.org/pods/SwiftLayout)
[![License](https://img.shields.io/cocoapods/l/SwiftLayout.svg?style=flat)](http://cocoapods.org/pods/SwiftLayout)
[![Platform](https://img.shields.io/cocoapods/p/SwiftLayout.svg?style=flat)](http://cocoapods.org/pods/SwiftLayout)

Often we have to use AutoLayout in our apps. In fact sometimes, we can't even use Interface Builder. Which means we need to add these programmatically.

I had previously done this manually, even occassionally used a 3rd party lib/pod. There are some great libs out there, but I wanted to build my own. Both for my own understanding and also to provide a cleaner interface that made programmatic AutoLayout easy.

_Introducing SwiftLayout_

```swift
import SwiftLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
      
      let view = UIView()
      view.backgroundColor = UIColor.redColor()
      self.view.addSubview(view)
      
      view.size(200, height: 100)
      view.alignVertically(self.view)
      view.pin(.Left, toEdge: .Left, ofView: self.view, margin: 20)
    }
  
}
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

SwiftLayout is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftLayout"
```

## Author

Shaps Mohsenin, shapsuk@me.com

## License

SwiftLayout is available under the MIT license. See the LICENSE file for more info.
