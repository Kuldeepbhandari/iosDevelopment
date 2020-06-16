//
//  RoundedButton.swift
//  SmackChatApp
//
//  Created by mac on 28/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedButton : UIButton{
    
    @IBInspectable var cornerRadius:CGFloat = 3.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    func setUpView(){
        self.layer.cornerRadius = cornerRadius
    }
}
