//
//  FancyFeild.swift
//  UpBeat
//
//  Created by Macos on 19/10/16.
//  Copyright © 2016 shraddha work station. All rights reserved.
//

import UIKit

class FancyFeild: UITextField {

    override func awakeFromNib() {
         layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: SHADOW_GRAY).cgColor
        layer.borderWidth = 1.0
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx:10 , dy: 5)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx:10 , dy: 5)
    }

}
