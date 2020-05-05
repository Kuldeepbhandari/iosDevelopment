//
//  ProfileSetupCell.swift
//  AppLumi
//
//  Created by appinventiv on 31/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class ProfileSetupCell: UICollectionViewCell {
    
    
    var tapOnAddImage : (() -> ())?
    
    @IBOutlet var profileImage: UIImageView!
    
    @IBOutlet var addImageBtn: UIButton!
    
    @IBAction func addImageBtn(_ sender: UIButton) {
        tapOnAddImage?()
        
        
    }
}



