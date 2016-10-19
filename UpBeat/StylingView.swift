//
//  StylingView.swift
//  UpBeat
//
//  Created by Macos on 19/10/16.
//  Copyright © 2016 shraddha work station. All rights reserved.
//

import UIKit

class StylingView: UIView {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: SHADOW_GRAY).cgColor
    layer.shadowOpacity = 0.8
    layer.shadowRadius = 5.0
    layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        
        
        
        
    }
    
}
