//
//  EducationView.swift
//  AppLumi
//
//  Created by appinventiv on 24/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class EducationView: UIView {

    @IBOutlet var religionImage: UIImageView!
    @IBOutlet var politicalImage: UIImageView!
    @IBOutlet var jobImage: UIImageView!
    @IBOutlet var educationImage: UIImageView!
    @IBOutlet var containerView: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let nibName = "EducationView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        registerNib()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        registerNib()
    }
    
    func registerNib(){
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        self.addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
    }
}
