//
//  LoginPageVC.swift
//  Employee Record System
//
//  Created by appinventiv on 24/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit


protocol SaveDataOnTappedRegisterProtocol:class {
    func sendDetails(dict : [String:Any])
}
class LoginPageVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var enmployeeInfo = [String: Any]()
    var chooseImage = UIImage()
    var isPickImage = false
    var alertOpen = false
    var removeImage = false
    let genderPicker = UIPickerView()
    var countryCode  = "+91"
    
    weak var delegate:SaveDataOnTappedRegisterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        hideKeyboardWhenTappedAround()
        if let navigationContorller = self.tabBarController?.viewControllers?[0] as? UINavigationController, let listViewController = navigationContorller.viewControllers.first as? ListDetailsVC{
            self.delegate = listViewController
        }
    }
    
    
    
    
    //    MARK:This fucntion is used to registe the Xib files in tableView
    private func registerNib(){
        tableView.register(UINib(nibName: "PhoneNoXib", bundle: nil), forCellReuseIdentifier: "PhoneNoXib")
        tableView.register(UINib(nibName: "NameTextfieldXIb", bundle: nil), forCellReuseIdentifier: "NameTextfieldXIb")
        tableView.register(UINib(nibName: "PasswordXib", bundle: nil), forCellReuseIdentifier: "PasswordXib")
        tableView.register(UINib(nibName: "AccpectTermsXib", bundle: nil), forCellReuseIdentifier: "AccpectTermsXib")
        tableView.register(UINib(nibName: "RegisterXib", bundle: nil), forCellReuseIdentifier: "RegisterXib")
        tableView.register(UINib(nibName: "SocialXib", bundle: nil), forCellReuseIdentifier: "SocialXib")
    }
}
//MARK:TableView Delegate and Datasource methods

extension LoginPageVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    //   MARK:This fucntion is used to return the row in cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch CellProperty.Property.allCases[indexPath.row]{
            
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoginPagecell") as! LoginPagecell
            cell.delegate = self
            if isPickImage{
                cell.profileImage.image = chooseImage
                cell.profileImage.contentMode = .scaleToFill
                alertOpen = true
            }else if removeImage{
                cell.profileImage.image = UIImage(named: "images-4")
            }            
            return cell
        case .name:
            let nameView = tableView.dequeueReusableCell(withIdentifier: "NameTextfieldXIb") as! NameTextfieldXIb
            nameView.textDelegate = self
            nameView.propertyName = "name"
            return nameView
            
        case .gender:
            let genderView = tableView.dequeueReusableCell(withIdentifier: "NameTextfieldXIb") as! NameTextfieldXIb
            genderView.nameTextField.placeholder = "Gender"
            genderView.nameTextField.tag = 2
            genderView.propertyName = "gender"
            genderView.textDelegate = self
            genderView.openPickerView()
            return genderView
            
        case .age:
            let ageView = tableView.dequeueReusableCell(withIdentifier: "NameTextfieldXIb") as! NameTextfieldXIb
            ageView.nameTextField.tag = 3
            ageView.textDelegate = self
            ageView.propertyName = "dob"
            ageView.openPickerView()
            return ageView
            
        case .email:
            let emailView = tableView.dequeueReusableCell(withIdentifier: "NameTextfieldXIb") as! NameTextfieldXIb
            emailView.nameTextField.tag = 5
            emailView.propertyName = "email"
            emailView.textDelegate = self
            emailView.nameTextField.placeholder = "Email ID"
            return emailView
            
        case .contactNo:
            let phoneView = tableView.dequeueReusableCell(withIdentifier: "PhoneNoXib") as! PhoneNoXib
            phoneView.propertyName = "phoneNo"
            phoneView.selectCountryBtn.addTarget(self, action: #selector(openCountryCodeVC), for: .touchUpInside)
            phoneView.selectCountryBtn.setTitle(countryCode, for: .normal)
            phoneView.textDelegate = self
           // enmployeeInfo["phone"] = phoneView.phoneNoTextField.text!
            

            return phoneView
        case .aadharNo:
            let aadharCardView = tableView.dequeueReusableCell(withIdentifier: "NameTextfieldXIb") as! NameTextfieldXIb
            aadharCardView.propertyName = "aadharNo"
           // enmployeeInfo["aadharCard"] = aadharCardView.nameTextField.text!
            aadharCardView.textDelegate = self
            aadharCardView.nameTextField.placeholder = "Aadhar Card Number"
            aadharCardView.nameTextField.tag = 6
            return aadharCardView
        case .department:
            let genderView = tableView.dequeueReusableCell(withIdentifier: "NameTextfieldXIb") as! NameTextfieldXIb
            genderView.nameTextField.tag = 7
            genderView.propertyName = "department"
            genderView.textDelegate = self
            genderView.openPickerView()
            genderView.nameTextField.placeholder = "Select Department"

            return genderView
        case .salary:
            let salaryView = tableView.dequeueReusableCell(withIdentifier: "NameTextfieldXIb") as! NameTextfieldXIb
            salaryView.nameTextField.tag = 8
            salaryView.propertyName = "salary"
            salaryView.textDelegate = self
            salaryView.nameTextField.placeholder = "Enter Salary "
            return salaryView
        case .empId:
            let empIdview = tableView.dequeueReusableCell(withIdentifier: "NameTextfieldXIb") as! NameTextfieldXIb
            empIdview.nameTextField.tag = 9
            empIdview.propertyName = "employeeId"
            empIdview.textDelegate = self
            empIdview.nameTextField.placeholder = "Enter Employee Id"
            return empIdview
        case .password:
            let passwordView = tableView.dequeueReusableCell(withIdentifier: "PasswordXib") as! PasswordXib
            enmployeeInfo["password"] = passwordView.passwordTextField.text!
            passwordView.showPassword()
            passwordView.propertyName = "password"
            passwordView.textDelegate = self
            passwordView.passwordTextField.placeholder = "Password"
            return passwordView
        case .accpectTerms:
            let accpectTerms = tableView.dequeueReusableCell(withIdentifier: "AccpectTermsXib") as! AccpectTermsXib
            return accpectTerms
        case .registerBtn:
            let registerView = tableView.dequeueReusableCell(withIdentifier: "RegisterXib") as! RegisterXib
            registerView.resgisterOutlet.addTarget(self, action: #selector(onTappedRegister), for: .touchUpInside)
            registerView.applyGradient()
            return registerView
        case .social:
            let socialXib = tableView.dequeueReusableCell(withIdentifier: "SocialXib") as! SocialXib
            return socialXib
        case .none:
            let phoneNo = tableView.dequeueReusableCell(withIdentifier: "PhoneNoXib") as! PhoneNoXib
            return phoneNo
        }
    }
    
    //    MARK:This function is used to select the gender
    @objc func openCountryCodeVC(){
        let selectCountryVC  = self.storyboard?.instantiateViewController(identifier: "SelectCountryCodeVC") as! SelectCountryCodeVC
        let navController = UINavigationController(rootViewController: selectCountryVC)
        selectCountryVC.delegate = self
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
        
    }
    
    @objc func popViewController(){
        self.view.endEditing(true)
    }
}
extension LoginPageVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
//MARK:This extension is used for implement country picker Protocol
extension LoginPageVC:PassCountryCode{
    func selectCountryCode(code: String) {
        countryCode = code
        tableView.reloadData()
    }
    
    @objc func reloadTableView(){
        tableView.reloadData()
    }
    
    
    @objc func onTappedRegister(){
       // tableView.reloadData()
        print(enmployeeInfo)
        delegate?.sendDetails(dict: enmployeeInfo)
    }

}



extension LoginPageVC: SendTextFieldText{
    func sendDetail(text: String, propertyName: String) {
        enmployeeInfo[propertyName] = text
    }
}

