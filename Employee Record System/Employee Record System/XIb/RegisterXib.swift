//
//  RegisterXib.swift
//  Employee Record System
//
//  Created by appinventiv on 24/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class RegisterXib: UITableViewCell {

    @IBOutlet var resgisterOutlet: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        applyGradient()
        self.resgisterOutlet.addTarget(self, action: #selector(ontappedRegisterBtn), for: .touchUpInside)
    }

    @objc func ontappedRegisterBtn(){
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func applyGradient(){
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemGreen.cgColor,UIColor.systemBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x:1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.resgisterOutlet.titleLabel?.font = UIFont(name: "Regular", size: 20)
        gradientLayer.frame = CGRect(x: 1, y: 0, width: self.resgisterOutlet.bounds.width, height: self.resgisterOutlet.bounds.height)
        self.resgisterOutlet.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
