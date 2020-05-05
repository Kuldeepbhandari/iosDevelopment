//
//  RoundView.swift
//  AppLumi
//
//  Created by appinventiv on 03/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
@IBDesignable
class RoundView: UIView {
    @IBInspectable var roundCorner:CGFloat = 20{
        didSet{
            layer.cornerRadius = roundCorner
        }
    }

    override func awakeFromNib() {
        setUpViews()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpViews()
    }
    
    func setUpViews(){
        layer.cornerRadius = roundCorner
        self.clipsToBounds = true
    }
    
    func boundKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardFrameChange(_ :)), name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardFrameChange(_ notification:Notification){
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        
    }
}
