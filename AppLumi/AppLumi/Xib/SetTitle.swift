//
//  SetTitle.swift
//  AppLumi
//
//  Created by appinventiv on 25/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SetTitle: UIView {

    @IBOutlet var containerView: UIView!
    
    @IBOutlet var backBtn: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed("SetTitle", owner: self, options: nil)
        self.addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
    

}
