//
//  TextField+Extension.swift
//  TravelApp
//
//  Created by mac on 28/02/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

extension UITextField{
    
    func setRightView(image:UIImage,isClicked:Bool = false){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        imageView.image = image
        
        if isClicked{
            let button = UIButton(frame: imageView.frame)
            button.setImage(#imageLiteral(resourceName: "icons8-email-50"), for: .normal)
            button.setImage(#imageLiteral(resourceName: "icons8-password-100"), for: .selected)
            button.isSelected = true
            button.addTarget(self, action: #selector(onClicked), for: .touchUpInside)
            rightView = button
        }else{
        rightView = imageView
        }
        rightViewMode = .always
    }
    
    @objc func onClicked(_ sender:UIButton){
        self.isSecureTextEntry = !self.isSecureTextEntry
        sender.isSelected = !sender.isSelected
    }
    
}
