//
//  CircleImage.swift
//  SmackChatApp
//
//  Created by mac on 29/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit
@IBDesignable
class CircleImage: UIImageView {

    @IBInspectable var roundCorner : CGFloat = 5{
        didSet{
            self.layer.cornerRadius = self.frame.width/2
            self.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
       setUpImage()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpImage()
    }
    
    func setUpImage(){
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
}
