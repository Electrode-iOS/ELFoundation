//
//  UIView.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 3/29/16.
//  Copyright © 2016 WalmartLabs. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func replaceView(view: UIView, newView: UIView) {
        let frame = view.frame
        newView.frame = frame
        view.copyConstraintsToView(newView)
        self.addSubview(newView)
        view.removeFromSuperview()
    }
    
    public func copyConstraintsToView(view: UIView) {
        if let superview = self.superview {
            for constraint in superview.constraints {
                if constraint.firstItem as! NSObject == self {
                    let newConstraint = NSLayoutConstraint(
                        item: view,
                        attribute: constraint.firstAttribute,
                        relatedBy: constraint.relation,
                        toItem: constraint.secondItem,
                        attribute: constraint.secondAttribute,
                        multiplier: constraint.multiplier,
                        constant: constraint.constant)
                    
                    superview.addConstraint(newConstraint)
                } else if constraint.secondItem as! NSObject == self {
                    let newConstraint = NSLayoutConstraint(
                        item: constraint.firstItem,
                        attribute: constraint.firstAttribute,
                        relatedBy: constraint.relation,
                        toItem: view,
                        attribute: constraint.secondAttribute,
                        multiplier: constraint.multiplier,
                        constant: constraint.constant)
                    
                    superview.addConstraint(newConstraint)
                }
            }
        }
    }
    
}