//
//  PasswordXib.swift
//  Employee Record System
//
//  Created by appinventiv on 24/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class PasswordXib: UITableViewCell {
    @IBOutlet var passwordTextField: UITextField!
    var iconClick = true
    @IBOutlet var showBtn: UIButton!
    var employeeInfo = [String:Any]()
    var propertyName = String()
    
    var textDelegate: SendTextFieldText?
    override func awakeFromNib() {
        super.awakeFromNib()
        passwordTextField.delegate = self
        showBtn.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func showPassword(){
       if iconClick {
        self.passwordTextField.isSecureTextEntry = true
        iconClick = false
       } else {
           self.passwordTextField.isSecureTextEntry = false
        iconClick = true
       }
       }
    
}

extension PasswordXib:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        employeeInfo[propertyName] = textField.text
        textDelegate?.sendDetail(text: textField.text!, propertyName: propertyName)
    }
}
