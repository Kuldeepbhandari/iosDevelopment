//
//  SignUpPhoneVC.swift
//  AppLumi
//
//  Created by appinventiv on 21/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SignUpPhoneVC: UIViewController {
    
//    MARK:Outlets
    @IBOutlet var mobileNoTF: UITextField!
    @IBOutlet var countryImage: UIImageView!
    @IBOutlet var selectCountryCode: UITextField!
    
    //    MARK:Controller Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetup()
    }
    
    private func initalSetup(){
        selectCountryCode.addTarget(self, action: #selector(openCountryCodeVC), for: .allEvents)
        hideKeyboardWhenTappedAround()
        countryImage.clipsToBounds = true
        mobileNoTF.delegate = self
        selectCountryCode.setRightView(image: #imageLiteral(resourceName: "icDropDown"))
    }
    
    //    MARK:This function is used to open a select country controller
    @objc func openCountryCodeVC(){
        
    
        let selectCountryVC  = self.storyboard?.instantiateViewController(identifier: "SelectCountryCodeVC") as! SelectCountryCodeVC
        let navController = UINavigationController(rootViewController: selectCountryVC)
        selectCountryVC.delegate = self
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    //    MARK:This function is used to genrate OTP
    @IBAction func tappedOnGetOtp(_ sender: UIButton) {
        guard let countrCode = selectCountryCode.text , selectCountryCode.text != nil else{return}
        guard let mobileNo = mobileNoTF.text , mobileNoTF.text != nil else{return}
        AuthServices.instance.sendOtpToPhone(countryCode: countrCode, mobileNo: mobileNo) { (sucess) in
            if sucess{
                print("sucess")
                let getOtpVC = self.storyboard?.instantiateViewController(identifier: PHONESIGNUPOTPVC) as! PhoneSignUpOTPVC
                getOtpVC.countryCode = countrCode
                getOtpVC.mobileNo = mobileNo
                self.navigationController?.pushViewController(getOtpVC, animated: true)
            }else{
                print("not get otp")
            }
        }
        
        
    }
    //    MARK:This fucntion is used to pop view controller
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:This protocol is used to set the country code and image in Signup Page VC
extension SignUpPhoneVC:PassCountryCode{
    func passCountryCode(code: String, image: UIImage) {
        selectCountryCode.text = code
        countryImage.image = image
    }
}
//MARK:TextFieldDelegate

extension SignUpPhoneVC:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return range.location < 10
    }
    
}
//MARK:This extension is used for if we tapped on a view it will hide the keyboard
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
