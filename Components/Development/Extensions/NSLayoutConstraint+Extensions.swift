//
//  NSLayoutConstraint+Extensions.swift
//  Components
//
//  Created by Luis Ferreira on 20/09/21.
//

import UIKit

// MARK: - Default Extensions
public extension UIView {
    
    // MARK: - Alignment
    @discardableResult
    func insetConstraints(inSuperview superView: UIView, withInset inset: UIEdgeInsets? = nil) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.inset(view: self, inSuperview: superView, withInset: inset)
        constraints.active()
        return constraints
    }
    
    // MARK: Vertical
    @discardableResult
    func safeAreaTop(safeAreaView: UIView, constant: CGFloat = 0, statusBar: Bool = false) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.safeAreaTop(safeAreaView: safeAreaView,
                                                        otherView: self,
                                                        constant: constant,
                                                        statusBar: statusBar)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func safeAreaBottom(safeAreaView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.safeAreaBottom(safeAreaView: safeAreaView, otherView: self, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func topConstraint(parentView: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.top(firstView: self, secondView: parentView, constant: constant, relatedBy: relation)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func bottomConstraint(parentView: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.bottom(firstView: self, secondView: parentView, constant: -constant, relatedBy: relation)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func overConstraint(topItem: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.over(topItem: topItem, bottomItem: self, constant: constant, relatedBy: relation)
        constraint.isActive = true
        return constraint
    }
    
    /// Aligns top and bottom constraint into a same parentView and constant spacing
    @discardableResult
    func verticalConstraint(parentView: UIView,
                            constant: CGFloat = 0,
                            relatedBy relation: NSLayoutConstraint.Relation = .equal) -> (topConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint) {
        return (topConstraint: topConstraint(parentView: parentView, constant: constant, relatedBy: relation),
                bottomConstraint: bottomConstraint(parentView: parentView, constant: constant, relatedBy: relation))
    }
    
    // MARK: Horizontal
    
    @discardableResult
    func aside(leftItem: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.aside(left: leftItem, right: self, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func leftConstraint(parentView: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.left(firstView: self, secondView: parentView, constant: constant, relatedBy: relation)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func rightConstraint(parentView: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.right(firstView: self, secondView: parentView, constant: -constant, relatedBy: relation)
        constraint.isActive = true
        return constraint
    }
    
    /// Aligns left and right constraint into a same parentView and constant spacing
    @discardableResult
    func horizontalConstraint(parentView: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> (leftConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint) {
        return (leftConstraint: leftConstraint(parentView: parentView, constant: constant, relatedBy: relation),
                rightConstraint: rightConstraint(parentView: parentView, constant: constant, relatedBy: relation))
    }
    
    // MARK: - Size
    
    @discardableResult
    func heightConstraint(constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.height(view: self, constant: constant, relatedBy: relation)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func heightConstraintEqualTo(parentView: UIView,
                                 constant: CGFloat = 0,
                                 multiplier: CGFloat = 1,
                                 relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.heightEqualTo(parentView: parentView,
                                                          view: self,
                                                          constant: constant,
                                                          multiplier: multiplier,
                                                          relatedBy: relation)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func widthConstraint(constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.width(view: self, constant: constant, relatedBy: relation)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func widthConstraintEqualTo(parentView: UIView,
                                constant: CGFloat = 0,
                                relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.widthEqualTo(parentView: parentView,
                                                         view: self,
                                                         constant: constant,
                                                         relatedBy: relation)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func aspectRatioConstraint(constant: CGFloat)-> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.aspectRatio(view: self, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Adds constraints to width and height based on same value
    @discardableResult
    func squareConstraint(constant: CGFloat) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        return (widthConstraint: widthConstraint(constant: constant),
                heightConstraint: heightConstraint(constant: constant))
    }
    
    // MARK: - Centralization
    
    @discardableResult
    func centerYConstraint(parentView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.centerY(firstView: self, secondView: parentView, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerXConstraint(parentView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.centerX(firstView: self, secondView: parentView, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Centers on parentView horizontally and vertically
    @discardableResult
    func centerConstraint(parentView: UIView) -> (constraintX: NSLayoutConstraint, constraintY: NSLayoutConstraint) {
        return (constraintX: centerXConstraint(parentView: parentView),
                constraintY: centerYConstraint(parentView: parentView))
    }
}

public extension NSLayoutConstraint {
    static func inset(view: UIView,
                      inSuperview superView: UIView,
                      withInset inset: UIEdgeInsets? = nil) -> [NSLayoutConstraint] {
        return [
            .top(firstView: superView, secondView: view, constant: -(inset?.top ?? 0)),
            .left(firstView: superView, secondView: view, constant: -(inset?.left ?? 0)),
            .right(firstView: superView, secondView: view, constant: (inset?.right ?? 0)),
            .bottom(firstView: superView, secondView: view, constant: (inset?.bottom ?? 0))
        ]
    }
    
    static func safeAreaTop(safeAreaView: UIView, otherView: UIView, constant: CGFloat = 0, statusBar: Bool = false)
        -> NSLayoutConstraint {
            if #available(iOS 11.0, *) {
                return safeAreaView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: otherView.topAnchor,
                                                                             constant: constant)
            } else {
                var finalConstant = constant
                
                if statusBar {
                    finalConstant = -20 + constant
                }
                
                return top(firstView: safeAreaView, secondView: otherView, constant: finalConstant)
            }
    }
    
    static func safeAreaBottom(safeAreaView: UIView, otherView: UIView, constant: CGFloat = 0)
        -> NSLayoutConstraint {
            if #available(iOS 11.0, *) {
                return safeAreaView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: otherView.bottomAnchor,
                                                                                constant: constant)
            } else {
                return bottom(firstView: safeAreaView, secondView: otherView, constant:constant)
            }
    }
    
    static func top(firstView: UIView, secondView: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstView,
                                      attribute: NSLayoutConstraint.Attribute.top,
                                      relatedBy: relation,
                                      toItem: secondView,
                                      attribute: NSLayoutConstraint.Attribute.top,
                                      multiplier: 1,
                                      constant: constant)
    }
    static func left(firstView: UIView, secondView: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstView,
                                      attribute: NSLayoutConstraint.Attribute.left,
                                      relatedBy: relation,
                                      toItem: secondView,
                                      attribute: NSLayoutConstraint.Attribute.left,
                                      multiplier: 1,
                                      constant: constant)
    }
    static func right(firstView: UIView, secondView: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstView,
                                      attribute: NSLayoutConstraint.Attribute.right,
                                      relatedBy: relation,
                                      toItem: secondView,
                                      attribute: NSLayoutConstraint.Attribute.right,
                                      multiplier: 1,
                                      constant: constant)
    }
    static func bottom(firstView: UIView, secondView: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstView,
                                      attribute: NSLayoutConstraint.Attribute.bottom,
                                      relatedBy: relation,
                                      toItem: secondView,
                                      attribute: NSLayoutConstraint.Attribute.bottom,
                                      multiplier: 1,
                                      constant: constant)
    }
    
    static func over(topItem: UIView, bottomItem: UIView, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: topItem,
                                      attribute: NSLayoutConstraint.Attribute.bottom,
                                      relatedBy: relation,
                                      toItem: bottomItem,
                                      attribute: NSLayoutConstraint.Attribute.top,
                                      multiplier: 1,
                                      constant: -1 * constant)
    }
    
    static func aside(left: UIView, right: UIView, constant: CGFloat = 0)
        -> NSLayoutConstraint {
            
            return NSLayoutConstraint(item: left,
                                      attribute: NSLayoutConstraint.Attribute.right,
                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                      toItem: right,
                                      attribute: NSLayoutConstraint.Attribute.left,
                                      multiplier: 1,
                                      constant: -1 * constant)
    }
    
    static func height(view: UIView, constant: CGFloat, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: relation,
                                  toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: constant)
    }
    
    static func heightEqualTo(parentView: UIView,
                              view: UIView,
                              constant: CGFloat,
                              multiplier: CGFloat,
                              relatedBy relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: relation,
                                  toItem: parentView,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
    static func width(view: UIView, constant: CGFloat, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relation,
                                  toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: constant)
    }
    
    static func widthEqualTo(parentView: UIView,
                             view: UIView,
                             constant: CGFloat,
                             relatedBy relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relation,
                                  toItem: parentView,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  multiplier: 1,
                                  constant: constant)
    }
    
    static func aspectRatio(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                  toItem: view,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  multiplier: constant,
                                  constant: 0)
    }
    
    static func centerY(firstView: UIView, secondView: UIView, constant: CGFloat = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstView,
                                      attribute: NSLayoutConstraint.Attribute.centerY,
                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                      toItem: secondView,
                                      attribute: NSLayoutConstraint.Attribute.centerY,
                                      multiplier: 1,
                                      constant: constant)
    }
    
    static func centerX(firstView: UIView, secondView: UIView, constant: CGFloat = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstView,
                                      attribute: NSLayoutConstraint.Attribute.centerX,
                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                      toItem: secondView,
                                      attribute: NSLayoutConstraint.Attribute.centerX,
                                      multiplier: 1,
                                      constant: constant)
    }
}

public extension Array where Element == NSLayoutConstraint {
    func active() {
        NSLayoutConstraint.activate(self)
    }
    
    func deactive() {
        NSLayoutConstraint.deactivate(self)
    }
}
