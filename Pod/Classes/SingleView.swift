/*
  Copyright © 2015 Shaps Mohsenin. All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY FRANCESCO PETRUNGARO `AS IS' AND ANY EXPRESS OR
  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
  EVENT SHALL FRANCESCO PETRUNGARO OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


// MARK: - Extends UI/NS View to provide better support for programmatic constraints
extension View {
  
  
  /**
  Resests all constraints for this view (similar to Xcode)
  */
  public func resetConstraints() {
    removeConstraints(constraints)
  }
  
  /**
  Resets all constraints for this views subviews (similar to Xcode)
  */
  public func resetSubViewConstraints() {
    for constraint: NSLayoutConstraint in self.constraints {
      let item = constraint.firstItem as? View
      if item != self {
        removeConstraint(constraint)
      }
    }
  }
  
  /**
  Pins the edges of 2 associated views
  
  - parameter edges:  The edges (bitmask) to pin
  - parameter view:   The second view to pin to
  - parameter margins: The margins to apply for each applicable edge
  
  - returns: The constaints that were added to this view
  */
  public func pin(edges: EdgeMask, of view: View, relation: NSLayoutRelation = .equal, margins: EdgeMargins = EdgeMargins(), priority: LayoutPriority = LayoutPriorityDefaultHigh) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    
    if edges.contains(.top) {
      constraints.append(pin(edge: .top, to: .top, of: view, relation: relation, margin: margins.top, priority: priority))
    }
    
    if edges.contains(.bottom) {
      constraints.append(pin(edge: .bottom, to: .bottom, of: view, relation: relation, margin: margins.bottom, priority: priority))
    }
    
    if edges.contains(.left) {
constraints.append(pin(edge: .left, to: .left, of: view, relation: relation, margin: margins.left, priority: priority))
    }
    
    if edges.contains(.right) {
      constraints.append(pin(edge: .right, to: .right, of: view, relation: relation, margin: margins.right, priority: priority))
    }
    
    return constraints
  }
  
  
  /**
  Pins a single edge to another views edge
  
  - parameter edge:   The edge of this view to pin
  - parameter toEdge: The edge of the second view to pin
  - parameter view:   The second view to pin to
  - parameter margin: The margin to apply to this constraint
  
  - returns: The constraint that was added
  */
  public func pin(edge: Edge, to otherEdge: Edge, of view: View, relation: NSLayoutRelation = .equal, margin: CGFloat = 0, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> NSLayoutConstraint {
    var constraint = Constraint(view: self)
    
    constraint.secondView = view
    constraint.firstAttribute = edgeAttribute(for: edge)
    constraint.secondAttribute = edgeAttribute(for: otherEdge)
    constraint.constant = (edge == .right && otherEdge == .left) || (edge == .bottom && otherEdge == .top) ? -1 * margin : margin
    constraint.relation = relation
    constraint.priority = priority
    
    let layoutConstraint = constraint.constraint()
    NSLayoutConstraint.activate([layoutConstraint])
    return layoutConstraint
  }
  
  /**
  Aligns this views center to another view
  
  - parameter axis:   The axis to align
  - parameter view:   The second view to align to
  - parameter offset: The offset to apply to this alignment
  
  - returns: The constraint that was added
  */
  public func align(axis: Axis, to view: View, offset: CGFloat = 0, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> NSLayoutConstraint {
    var constraint = Constraint(view: self)
    
    constraint.secondView = view
    constraint.firstAttribute = centerAttribute(for: axis)
    constraint.secondAttribute = centerAttribute(for: axis)
    constraint.constant = offset
    constraint.priority = priority
    
    let layoutConstraint = constraint.constraint()
    NSLayoutConstraint.activate([layoutConstraint])
    return layoutConstraint
  }

  /**
  Sizes this view
  
  - parameter axis:     The axis to size
  - parameter relation: The relation for this sizing, equal, greaterThanOrEqual, lessThanOrEqual
  - parameter size:     The size to set
  
  - returns: The constraint that was added
  */
  public func size(axis: Axis, relation: NSLayoutRelation, size: CGFloat, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> NSLayoutConstraint {
    var constraint = Constraint(view: self)
    
    constraint.firstAttribute = sizeAttribute(for: axis)
    constraint.secondAttribute = sizeAttribute(for: axis)
    constraint.relation = relation
    constraint.constant = size
    constraint.priority = priority
    
    let layoutConstraint = constraint.constraint()
    NSLayoutConstraint.activate([layoutConstraint])
    return layoutConstraint
  }
  
  /**
  Sizes this view's axis relative to another view axis. Note: The axis for each view doesn't have to be the same
  
  - parameter axis:      The axis to size
  - parameter otherAxis: The other axis to use for sizing
  - parameter view:      The second view to reference
  - parameter ratio:     The ratio to apply to this sizing. (e.g. 0.5 would size this view by 50% of the second view's edge)
  
  - returns: The constraint that was added
  */
  public func size(axis: Axis, to otherAxis: Axis, of view: View, ratio: CGFloat = 1, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> NSLayoutConstraint {
    var constraint = Constraint(view: self)
    
    constraint.secondView = view
    constraint.firstAttribute = sizeAttribute(for: axis)
    constraint.secondAttribute = sizeAttribute(for: otherAxis)
    constraint.multiplier = ratio
    constraint.priority = priority
    
    let layoutConstraint = constraint.constraint()
    NSLayoutConstraint.activate([layoutConstraint])
    return layoutConstraint
  }
  
}


// MARK: - Extends UI/NS View with some additional convenience methods
extension View {
  
  /**
   Sizes the view to the specified width and height
   
   - parameter width:  The width
   - parameter height: The height
   
   - returns: The constraint that was added
   */
  public func size(width width: CGFloat, height: CGFloat, relation: NSLayoutRelation = .equal, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> [NSLayoutConstraint] {
    let horizontal = size(axis: .horizontal, relation: relation, size: width, priority: priority)
    let vertical = size(axis: .vertical, relation: relation, size: height, priority: priority)
    return [horizontal, vertical]
  }
  
  public func pin(edges: EdgeMask, to view: View) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()
    
    if edges.contains(.left) {
      constraints.append(pin(leftTo: view))
    }
    
    if edges.contains(.right) {
      constraints.append(pin(rightTo: view))
    }
    
    if edges.contains(.top) {
      constraints.append(pin(topTo: view))
    }
    
    if edges.contains(.bottom) {
      constraints.append(pin(bottomTo: view))
    }
    
    return constraints
  }
  
  /**
  Pins the top edge of this view to the top of the specified view
  
  - parameter view: The reference view to pin to
  
  - returns: The constraint that was added
  */
  public func pin(topTo view: View) -> NSLayoutConstraint {
    return pin(edge: .top, to: .top, of: view, margin: frame.minY)
  }
  
  /**
  Pins the left edge of this view to the left of the specified view
  
  - parameter view: The reference view to pin to
  
  - returns: The constraint that was added
  */
  public func pin(leftTo view: View) -> NSLayoutConstraint {
    return pin(edge: .left, to: .left, of: view, margin: frame.minX)
  }
  
  /**
  Pins the bottom edge of this view to the bottom of the specified view
  
  - parameter view: The reference view to pin to
  
  - returns: The constraint that was added
  */
  public func pin(bottomTo view: View) -> NSLayoutConstraint {
    return pin(edge: .bottom, to: .bottom, of: view, margin: view.bounds.maxY - frame.maxY)
  }
  
  /**
  Pins the right edge of this view to the right of the specified view
  
  - parameter view: The reference view to pin to
  
  - returns: The constraint that was added
  */
  public func pin(rightTo view: View) -> NSLayoutConstraint {
    return pin(edge: .right, to: .right, of: view, margin: view.bounds.maxX - frame.maxX)
  }

  /**
   Aligns the center vertically to the specified view
   
   - parameter view: The reference view to align to
   
   - returns: The constraint that was added
   */
  public func align(horizontallyTo view: View) -> NSLayoutConstraint {
    return align(axis: .horizontal, to: view, offset: 0)
  }
  
  /**
   Aligns the center vertically to the specified view
   
   - parameter view: The reference view to align to
   
   - returns: The constraint that was added
   */
  public func align(verticallyTo view: View) -> NSLayoutConstraint {
    return align(axis: .vertical, to: view, offset: 0)
  }
  
}

