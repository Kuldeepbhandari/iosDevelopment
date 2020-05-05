//
//  CustomView.swift
//  AppLumi
//
//  Created by appinventiv on 20/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
@IBDesignable
class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndCorner()
    }
    
    @IBInspectable var roundCorner:CGFloat = 3{
        didSet{
            self.layer.cornerRadius = roundCorner
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRadiusAndCorner()
    }
    
    func setRadiusAndCorner(){
        layer.cornerRadius = 3
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 1, height: 0)
        layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }

}
