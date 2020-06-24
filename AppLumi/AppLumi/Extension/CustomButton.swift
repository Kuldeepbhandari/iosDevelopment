//
//  CustomButton.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 20/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
@IBDesignable
class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndCorner()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRadiusAndCorner()
    }
    func setRadiusAndCorner(){
        layer.cornerRadius = 17.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
  

}

