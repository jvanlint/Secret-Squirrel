//
//  CornerView.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 12/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable public class CornerView: UIView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            
            layer.cornerRadius = cornerRadius
        }
    }
    
    override public func layoutSubviews() {
        
        super.layoutSubviews()
        //layer.cornerRadius = 5
        clipsToBounds = true
    }
}
