//
//  AvatarCell.swift
//  SmackChatApp
//
//  Created by mac on 29/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

enum AvatarType{
    case Light
    case Dark
}

class AvatarCell: UICollectionViewCell {
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    
    func setUpViews(){
        self.layer.backgroundColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func configureSegment(index:Int,avatarType:AvatarType){
        if avatarType == .Dark{
            self.avatarImage.image = UIImage(named: "dark\(index)")
            self.avatarImage.layer.backgroundColor = UIColor.darkGray.cgColor
        }else{
            self.avatarImage.image = UIImage(named: "light\(index)")
            self.avatarImage.layer.backgroundColor = UIColor.darkGray.cgColor
        }
    }
    
}
