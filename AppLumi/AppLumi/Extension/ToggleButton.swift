//
//  ToggleButton.swift
//  AppLumi
//
//  Created by appinventiv on 14/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class ToggleButton: UIButton {

    var isCheckd:Bool = false{
        didSet{
            if isCheckd == true{
                print("Select isChecked \(isCheckd)")
                layer.backgroundColor = AppColors.selectBtn.cgColor
                self.setTitleColor(AppColors.selectTitleColor, for: .normal)
            }else{
                print("Select Deselect \(isCheckd)")

                layer.backgroundColor = AppColors.defaultColor.cgColor
                self.setTitleColor(AppColors.defaultTitleColor, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.isCheckd = false
    }
    
    @objc func buttonClicked(sender:UIButton){
        if sender == self{
            if isCheckd == true{
                isCheckd = false
            }else{
                isCheckd = true
            }
        }
    }
}
