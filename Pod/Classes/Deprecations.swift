//
//  Deprecations.swift
//  SwiftLayout
//
//  Created by Shaps Mohsenin on 21/06/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

extension Array where Element: View {
  
  func test() {
    
  }
  
}


@available(*, unavailable, renamed: "sizeAttribute(for:)")
public func sizeAttribute(axis: Axis) -> NSLayoutAttribute {
  return sizeAttribute(for: axis)
}

@available(*, unavailable, renamed: "sizeAttribute(for:)")
public func centerAttribute(axis: Axis) -> NSLayoutAttribute {
  return centerAttribute(for: axis)
}

@available(*, unavailable, renamed: "edgeAttribute(for:)")
public func edgeAttribute(edge: Edge) -> NSLayoutAttribute {
  return edgeAttribute(for: edge)
}

extension View {
  
  @available(*, unavailable, renamed: "Array.test")
  public func test() {
    
  }
  
  @available(*, unavailable, renamed: "constraints(for:)")
  public func constraintsForTrait(trait: ConstraintsTraitMask) -> [NSLayoutConstraint] {
    return constraints(for: trait)
  }
  
  @available(*, unavailable, renamed: "contains(trait:)")
  public func containsTraits(trait: ConstraintsTraitMask) -> Bool {
    return contains(trait: trait)
  }
  
  @available(*, unavailable, renamed: "pin(topTo:)")
  public func pinTop(toView: View) -> NSLayoutConstraint {
    return pin(topTo: toView)
  }
  
  @available(*, unavailable, renamed: "pin(leftTo:)")
  public func pinLeft(toView: View) -> NSLayoutConstraint {
    return pin(leftTo: toView)
  }
  
  @available(*, unavailable, renamed: "pin(bottomTo:)")
  public func pinBottom(toView: View) -> NSLayoutConstraint {
    return pin(bottomTo: toView)
  }
  
  @available(*, unavailable, renamed: "pin(rightTo:)")
  public func pinRight(toView: View) -> NSLayoutConstraint {
    return pin(rightTo: toView)
  }
  
  @available(*, unavailable, renamed: "align(horizontallyTo:)")
  public func alignHorizontally(toView: View) -> NSLayoutConstraint {
    return align(horizontallyTo: toView)
  }
  
  @available(*, unavailable, renamed: "align(verticallyTo:)")
  public func alignVertically(toView: View) -> NSLayoutConstraint {
    return align(verticallyTo: toView)
  }
  
  @available(*, unavailable, renamed: "pin(edges:to:)")
  public func pinEdges(edges: EdgeMask, toView: View) -> [NSLayoutConstraint] {
    return pin(edges: edges, to: toView)
  }
  
//  @available(*, unavailable, renamed: "size(axis:of:to:relation:ratio:priority:)")
//  public static func size(axis: Axis, ofViews views: [View], relativeTo otherAxis: Axis, ofView view: View, ratio: CGFloat = 1, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> [NSLayoutConstraint] {
//    
//  }
//  
//  @available(*, unavailable, renamed: "size(axis:of:relation:size:priority:)")
//  public static func size(axis: Axis, ofViews views: [View], relatedBy relation: NSLayoutRelation, size: CGFloat, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> [NSLayoutConstraint] {
//    return size(axis: axis, of: views, relation: relation, size: size, priority: priority)
//  }
//  
//  @available(*, unavailable, renamed: "align(axis:of:to:offset:priority:)")
//  public static func align(axis: Axis, ofViews views: [View], toView view: View, offset: CGFloat = 0, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> [NSLayoutConstraint] {
//    return align(axis: axis, of: views, to: view, offset: offset, priority: priority)
//  }
//  
//  @available(*, unavailable, renamed: "pin(edge:of:to:of:relation:margin:priority:)")
//  public static func pin(edge: Edge, ofViews views: [View], toEdge: Edge, ofView view: View, relation: NSLayoutRelation = .equal, margin: CGFloat = 0, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> [NSLayoutConstraint] {
//    return pin(edge: edge, of: views, to: toEdge, of: view, relation: relation, margin: margin, priority: priority)
//  }
  
//  @available(*, unavailable, renamed: "size(axis:to:of:ratio:priority:)")
//  public func size(axis: Axis, toAxis otherAxis: Axis, ofView view: View, ratio: CGFloat = 1, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> NSLayoutConstraint {
//    return size(axis: axis, to: otherAxis, of: view, ratio: ratio, priority: priority)
//  }
//  
//  @available(*, unavailable, renamed: "size(axis:relation:size:priority:)")
//  public func size(axis: Axis, relatedBy relation: NSLayoutRelation, size: CGFloat, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> NSLayoutConstraint {
//    return size(axis: axis, relation: relation, size: size, priority: priority)
//  }
//  
//  @available(*, unavailable, renamed: "align(axis:to:offset:priority:)")
//  public func align(axis: Axis, toView view: View, offset: CGFloat = 0, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> NSLayoutConstraint {
//    align(axis: axis, to: view, offset: offset, priority: priority)
//  }
//  
//  @available(*, unavailable, renamed: "pin(edge:to:of:relation:margin:priority:)")
//  public func pin(edge: Edge, toEdge: Edge, toView view: View, relation: NSLayoutRelation = .equal, margin: CGFloat = 0, priority: LayoutPriority = LayoutPriorityDefaultHigh) -> NSLayoutConstraint {
//    pin(edge: edge, to: toEdge, of: view, relation: relation, margin: margin, priority: priority)
//  }
//  
//  @available(*, unavailable, renamed: "pin(edges:to:relation:margins:priority:)")
//  public func pin(edges: EdgeMask, toView view: View, relation: NSLayoutRelation = .equal, margins: EdgeMargins = EdgeMargins(), priority: LayoutPriority = LayoutPriorityDefaultHigh) -> [NSLayoutConstraint] {
//    return pin(edges: edges, to: view, relation: relation, margins: margins, priority: priority)
//  }
//  
//  @available(*, unavailable, renamed: "pin(edges:of:to:relation:margins:priority:)")
//  public static func pin(edges: EdgeMask, ofViews views: [View], toView view: View, relation: NSLayoutRelation = .equal, margins: EdgeMargins = EdgeMargins(), priority: LayoutPriority = LayoutPriorityDefaultHigh) -> [NSLayoutConstraint] {
//    return pin(edges: edges, of: views, to: view, relation: relation, margins: margins, priority: priority)
//  }
  
}
