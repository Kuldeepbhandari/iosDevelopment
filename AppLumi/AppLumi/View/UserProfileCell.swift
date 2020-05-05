//
//  UserProfileCell.swift
//  AppLumi
//
//  Created by mac on 02/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class UserProfileCell: UICollectionViewCell {
    
    @IBOutlet weak var containerVIew: UIView!
    @IBOutlet weak var answerLbl: UILabel!
    
    @IBOutlet weak var questionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerVIew.translatesAutoresizingMaskIntoConstraints = false
    }
}
