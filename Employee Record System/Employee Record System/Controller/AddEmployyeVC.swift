//
//  AddEmployyeVC.swift
//  Employee Record System
//
//  Created by appinventiv on 19/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
protocol passDataProtocol {
    func dataPass(dict:[String:Any])
}

class AddEmployyeVC: UIViewController {
    //MARK:-IBOutlets
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var employeeIDTf: UITextField!
    @IBOutlet weak var departmentTF: UITextField!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet var mobileNoTF: UITextField!
    @IBOutlet var addressTF: UITextField!
    //    MARK:-Varibales
    let datePicker = UIDatePicker()
    let departmentPicker = UIPickerView()
    let genderPicker = UIPickerView()
    var delegate:passDataProtocol?
    var department = DepartmentName.allCases
    //    MARK:-Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSetup()
        
    }
    private func intialSetup(){
        hideKeyboardWhenTappedAround()
        if let navigationContorller = self.tabBarController?.viewControllers?[0] as? UINavigationController, let listViewController = navigationContorller.viewControllers.first as? ListDetailsVC{
           // self.delegate = listViewController
        }
        emailTF.delegate = self
        dobTF.delegate = self
        employeeIDTf.delegate = self
        departmentTF.delegate = self
        nameTf.delegate = self
        setDate()
        departmentPickerDelegate()
        selectGender()
    }
    
    //    MARK:This function is used to save Informtion
    @IBAction func saveBtnTaped(_ sender: UIButton) {
        if emailTF.text! == "" || dobTF.text! == "" || employeeIDTf.text! == "" || departmentTF.text! == "" || nameTf.text! == "" || emailTF.text! == "" || addressTF.text == ""{
            validateTextField()
        }else{
            saveDataAlert()
        }
    }
}

//MARK:-This extension is used for hide keyboard when i tap outside of keyboard
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
//MARK:-This extension is used to when i prees enter on keyboard
extension AddEmployyeVC:UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


//MARK:-Department DatePicker Delegate
extension AddEmployyeVC:UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == departmentPicker{
            return DepartmentName.allCases.count
        }else{
            return Gender.allCases.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == departmentPicker{
            return DepartmentName.allCases[row].rawValue
        }else{
            return Gender.allCases[row].rawValue
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == departmentPicker{
            departmentTF.text = DepartmentName.allCases[row].rawValue
        }else{
            genderTextField.text = Gender.allCases[row].rawValue
        }
    }
}
//MARk:-This extension is used to AddEmloyee In ViewController

extension AddEmployyeVC{
    //MARK:This function is used to select date
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
        dobTF.inputAccessoryView = toolBar
        dobTF.inputView = datePicker
    }
    
    //    MARK:-This function is used to select the gender using picekr view
    private func selectGender(){
        genderPicker.delegate = self
        genderPicker.dataSource = self
        genderTextField.inputView = genderPicker
    }
    //    MARK:-This function is used to select the gender using picekr view
    private func departmentPickerDelegate(){
        departmentPicker.delegate = self
        departmentPicker.dataSource = self
        departmentTF.inputView = departmentPicker
    }
    
    @objc private func doneDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM  DD,YYYY"
        formatter.dateStyle = DateFormatter.Style.medium
        dobTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
    }
    //MARK:-This function is used to dismiss the view when i touch in cancel button
    @objc private func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    //MARK:This function is used to validate the textfield
    private func validateTextField(){
        if emailTF.text == "" || dobTF.text == "" || employeeIDTf.text == "" || departmentTF.text == "" || nameTf.text == "" || addressTF.text == "" ||  emailTF.text! == ""{
            let alert = UIAlertController(title: "Please Fill All the details", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    //MARK:-This function is used to show alert when i save the data
    private func saveDataAlert(){
        let alert = UIAlertController(title: "Your Data is saved", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (name) in
            self.delegate?.dataPass(dict: ["name":self.nameTf.text!,"department":self.departmentTF.text!,"dob":self.dobTF.text!,"employeeID":self.employeeIDTf.text!,"gender":self.genderTextField.text!,"email":self.emailTF.text!,"address":self.addressTF.text!])
        }))
        self.present(alert, animated: false, completion: nil)
    }
}
