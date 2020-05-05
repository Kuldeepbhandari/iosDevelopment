//
//  SetUpAlcoholView.swift
//  AppLumi
//
//  Created by appinventiv on 24/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SetUpAlcoholView: UIView {

    @IBOutlet var durgImage: UIImageView!
    @IBOutlet var marijunaImage: UIImageView!
    @IBOutlet var alcoholmage: UIImageView!
    @IBOutlet var ciggerateImage: UIImageView!
    @IBOutlet var politicalImage: UIImageView!
    @IBOutlet var religonImage: UIImageView!
    
    @IBOutlet var containerView: UIView!
    
    let nibName = "SetUpAlcoholView"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
    
    func commonInit(){
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        self.addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    
    
}
