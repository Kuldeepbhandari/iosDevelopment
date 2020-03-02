//
//  UiButton+Design.swift
//  TravelApp
//
//  Created by mac on 27/02/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

extension UIButton{
    
    func designButton( borderWidth:CGFloat = 1, borderColor:UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)){
        clipsToBounds = true
        layer.cornerRadius = frame.height/2
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
