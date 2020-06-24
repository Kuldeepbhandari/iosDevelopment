//
//  BorderView.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 25/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class BorderView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBorder()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setBorder()
    }
    
    func setBorder(){
        self.backgroundColor = UIColor.clear
        self.layer.borderColor = UIColor(displayP3Red: 242, green: 242, blue: 242, alpha:  0.5).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 2
    }
    

}
