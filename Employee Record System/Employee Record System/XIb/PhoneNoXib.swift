//
//  PhoneNoXib.swift
//  Employee Record System
//
//  Created by appinventiv on 24/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

//protocol SendPhoneTextFieldText{
//    func sendDetail(text: String,propertyName: String)
//}

class PhoneNoXib: UITableViewCell {

    @IBOutlet var selectCountryBtn: UIButton!
    @IBOutlet var phoneNoTextField: UITextField!
    
    var employeeInfo = [String:Any]()
       var propertyName = String()
       
       var textDelegate: SendTextFieldText?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        phoneNoTextField.delegate = self
        let selectCountry = SelectCountryCodeVC()
        selectCountry.delegate = self
        //selectCountryBtn.addTarget(self, action: #selector(openCountryCodeVC), for: .touchUpInside)
    }

   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension PhoneNoXib:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return range.location < 10
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        employeeInfo[propertyName] = textField.text
        textDelegate?.sendDetail(text: textField.text!, propertyName: propertyName)
    }
}

//MARK:This extension is used for implement country picker Protocol
extension PhoneNoXib:PassCountryCode{
    func selectCountryCode(code: String) {
        selectCountryBtn.setTitle(code, for: .normal)
    }
    
    
}
