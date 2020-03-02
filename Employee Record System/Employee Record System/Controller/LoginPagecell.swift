//
//  LoginPagecell.swift
//  Employee Record System
//
//  Created by appinventiv on 24/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

protocol PresentViewController : class {
    func presentViewController()
}

class LoginPagecell: UITableViewCell {

    @IBOutlet var selectProfileBtn: UIButton!
    @IBOutlet var profileImage: UIImageView!
    weak var delegate:PresentViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImageInCircleShape()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    MARK:This function is used to open action Sheet
    
    func setImageInCircleShape(){
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        profileImage.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openImageSelectView))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func openImageSelectView(){
        delegate?.presentViewController()
    }
}


