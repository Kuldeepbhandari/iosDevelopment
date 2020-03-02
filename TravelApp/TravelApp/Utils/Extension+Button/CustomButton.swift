//
//  CustomButton.swift
//  TravelApp
//
//  Created by mac on 27/02/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit


class CustomButton : UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndCorner()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRadiusAndCorner()
    }
    
    
    
    func setRadiusAndCorner(){
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
}
