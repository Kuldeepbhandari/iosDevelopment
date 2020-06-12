//
//  InformationView.swift
//  AppLumi
//
//  Created by appinventiv on 24/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class InformationView: UIView {

    @IBOutlet var ageImage: UIImageView!
    @IBOutlet var genderImage: UIImageView!
    @IBOutlet var locationImage: UIImageView!
    @IBOutlet var heightImage: UIImageView!
    @IBOutlet var bioImage: UIImageView!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var containerView: UIView!
    
    let nibName = "InformationView"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        self.addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
}
