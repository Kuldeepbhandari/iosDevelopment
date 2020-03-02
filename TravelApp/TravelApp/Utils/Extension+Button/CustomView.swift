//
//  CustomView.swift
//  TravelApp
//
//  Created by mac on 27/02/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class CustomView : UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndCorner()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRadiusAndCorner()
    }
    
    
    
    func setRadiusAndCorner(){
        layer.cornerRadius = 5
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 0)
        layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
}
