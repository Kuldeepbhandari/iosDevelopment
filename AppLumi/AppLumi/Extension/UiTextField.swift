//
//  UiTextField.swift
//  AppLumi
//
//  Created by appinventiv on 24/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable extension UITextField{
    
    
    func setRightView(image:UIImage){
        let imageView = UIImageView(frame: CGRect(x: 50, y: self.bounds.origin.y/2, width: 10.5, height: 5))
        imageView.image = image
        rightView = imageView
        rightViewMode = .always
    }
    
    @IBInspectable var cornderRadius:CGFloat{
        set{
            layer.cornerRadius = newValue
        }get{
            return  layer.cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
           set {
               guard let uiColor = newValue else { return }
               layer.borderColor = uiColor.cgColor
           }
           get {
               guard let color = layer.borderColor else { return nil }
               return UIColor(cgColor: color)
           }
       }
}
