//
//  RoundImage.swift
//  AppLumi
//
//  Created by appinventiv on 01/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class RoundImage:UIImageView{
    
    @IBInspectable var roundCorner : CGFloat = 3{
        didSet{
            self.layer.cornerRadius = roundCorner
        }
    }
    
    override func awakeFromNib() {
        roundImageCorner()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        roundImageCorner()
    }
    
    func roundImageCorner(){
        self.layer.cornerRadius = roundCorner
        self.clipsToBounds = true
    }
    
   
}
