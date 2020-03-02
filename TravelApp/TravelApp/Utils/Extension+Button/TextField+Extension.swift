//
//  TextField+Extension.swift
//  TravelApp
//
//  Created by mac on 28/02/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

extension UITextField{
    
    func setRightView(image:UIImage){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        imageView.image = image
        rightView = imageView
        rightViewMode = .always
        
    }
}
