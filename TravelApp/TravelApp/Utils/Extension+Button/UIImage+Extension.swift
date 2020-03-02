//
//  UIImage+Extension.swift
//  TravelApp
//
//  Created by mac on 28/02/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

extension UIImageView{
    func setCornerRadius(){
        let imgage = UIImageView()
        imgage.layer.cornerRadius = imgage.frame.width/2
    }
}
