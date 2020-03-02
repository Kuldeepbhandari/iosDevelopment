//
//  CustomView.swift
//  Employee Record System
//
//  Created by mac on 01/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class CustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpRadiusCorner()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpRadiusCorner()
    }
    
    func setUpRadiusCorner(){
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
    }
}
