//
//  NameTextfieldXIb.swift
//  Employee Record System
//
//  Created by appinventiv on 24/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

protocol SendTextFieldText{
    func sendDetail(text: String,propertyName: String)
}


class NameTextfieldXIb: UITableViewCell ,UITextFieldDelegate{

    @IBOutlet var nameTextField: UITextField!
    let genderPicker = UIPickerView()
    let agePicker = UIPickerView()
    let datePicker = UIDatePicker()
    let departmentPicker = UIPickerView()
    var employeeInfo = [String:Any]()
    var propertyName = String()
    
    var textDelegate: SendTextFieldText?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func openPickerView(){
        if nameTextField.tag == 2{
        nameTextField.rightView = UIImageView(image: #imageLiteral(resourceName: "icDrop"))
        nameTextField.rightViewMode = .always
        genderPicker.delegate = self
        genderPicker.dataSource = self
        nameTextField.inputView = genderPicker
        }else if nameTextField.tag == 3{
            nameTextField.placeholder = "Age"
            nameTextField.rightView = UIImageView(image: #imageLiteral(resourceName: "icCalendar"))
            nameTextField.rightViewMode = .always
            agePicker.delegate = self
            agePicker.dataSource = self
            nameTextField.inputView = agePicker
            setDate()
        }else if nameTextField.tag == 7{
            departmentPicker.delegate = self
            departmentPicker.dataSource = self
            nameTextField.inputView = departmentPicker
            nameTextField.rightView = UIImageView(image: #imageLiteral(resourceName: "icDrop"))
            nameTextField.rightViewMode = .always
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 6{
            return range.location < 12
        }else{
            return range.location < 41
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        employeeInfo[propertyName] = textField.text
        textDelegate?.sendDetail(text: textField.text!,propertyName: propertyName)
    }
}


//MARK:This extension is used to confirm the pickerView Delegate and textfield selector method
extension NameTextfieldXIb:UIPickerViewDelegate,UIPickerViewDataSource{
   

//    These two funtion are pickerView datasource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genderPicker{
            return Gender.allCases.count
        }else{
            return DepartmentName.allCases.count
        }
       }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == genderPicker{
        nameTextField.text = Gender.allCases[row].rawValue
        }else {
            nameTextField.text = DepartmentName.allCases[row].rawValue
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderPicker{
        return Gender.allCases[row].rawValue
        }else{
            return DepartmentName.allCases[row].rawValue
        }
    }
}


//MARK:this extension is used to open dob picker
extension NameTextfieldXIb{
    private func setDate(){
           datePicker.datePickerMode = .date
           let toolBar = UIToolbar()
           toolBar.barStyle = UIBarStyle.default
           toolBar.isTranslucent = true
           toolBar.sizeToFit()
           let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
           let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
           let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
           toolBar.setItems([doneButton,spaceButton,cancelButton], animated: false)
           nameTextField.inputAccessoryView = toolBar
           nameTextField.inputView = datePicker
       }
    
    @objc private func doneDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM  DD,YYYY"
        formatter.dateStyle = DateFormatter.Style.medium
        nameTextField.text = formatter.string(from: datePicker.date)
    
        self.endEditing(true)
    }
    //MARK:-This function is used to dismiss the view when i touch in cancel button
    @objc private func cancelDatePicker(){
       // self.view.endEditing(true)
        self.endEditing(true)
    }
    
    
}
