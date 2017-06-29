//
//  CornerLabel.swift
//  CodeNameGenerator
//
//  Created by Jason van Lint on 6/1/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit

///  Subclass of UILabel that creates a wire framed button with adjustable border colors and widths along with adjustable corner radius.
///
/// - Remark: Uses IBDesignable and IBInpectable key words to enable use in Storyboards and attribute settings in the properties panel.
@IBDesignable public class CornerLabel: UILabel {
    
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
