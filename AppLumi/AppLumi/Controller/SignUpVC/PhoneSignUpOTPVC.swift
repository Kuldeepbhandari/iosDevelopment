//
//  PhoneSignUpOTPVC.swift
//  AppLumi
//
//  Created by appinventiv on 21/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class PhoneSignUpOTPVC: UIViewController {
    
    //    MARK:Outlets
    @IBOutlet var lblResendCode: UILabel!
    @IBOutlet var tFieldFourth: UITextField!
    @IBOutlet var tFieldThird: UITextField!
    @IBOutlet var tFieldSecond: UITextField!
    @IBOutlet var tFieldFirst: UITextField!
    
    //    MARK:Controller Life Cycle Method
    
    var mobileNo:String?
    var countryCode:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetup()
    }
    
    private func initalSetup(){
        tFieldFirst.delegate = self
        tFieldSecond.delegate = self
        tFieldThird.delegate = self
        tFieldFourth.delegate = self
        tFieldFirst.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        tFieldSecond.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        tFieldThird.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        tFieldFourth.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resendCode))
        lblResendCode.isUserInteractionEnabled = true
        lblResendCode.addGestureRecognizer(tapGesture)
    }
    
    @objc func textFieldDidChange(textField:UITextField){
        if let textCount = textField.text , textField.text != nil {
            if textField == tFieldFirst && textCount.utf16.count >= 1{
                tFieldSecond.becomeFirstResponder()
            }
            else if textField == tFieldSecond{
                tFieldThird.becomeFirstResponder()
            }else if textField == tFieldThird{
                tFieldFourth.becomeFirstResponder()
            }
            else if textField == tFieldFourth{
                tFieldFourth.becomeFirstResponder()
            }
            if textCount.count == 0{
                switch textField{
                case tFieldFirst:
                    tFieldFirst.resignFirstResponder()
                case tFieldSecond:
                    tFieldFirst.becomeFirstResponder()
                case tFieldThird:
                    tFieldSecond.becomeFirstResponder()
                case tFieldFourth:
                    tFieldThird.becomeFirstResponder()
                default:
                    break
                }
            }else{
                return
            }
        }
    }
    //    }
    //MARK:Thid function is used when i tap on Resend code label
    @objc func resendCode(){
        let alert = UIAlertController(title: "Code Is Resend", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    //    MARK:This function is used to vefiry otp if otp is match then it goes to next VC
    @IBAction func tappedOnVerify(_ sender: UIButton) {
        guard let first = tFieldFirst.text , tFieldFirst.text != "" else {return}
        guard let second = tFieldSecond.text , tFieldSecond.text != "" else {return}
        guard let third = tFieldThird.text , tFieldThird.text != "" else {return}
        guard let fourth = tFieldFourth.text , tFieldFourth.text != "" else {return}
        let verifyCode = "\(first)\(second)\(third)\(fourth)"
        print(verifyCode)
        guard let mobileNo = self.mobileNo  , mobileNo  !=  "" else {return}
        guard let countryCode = self.countryCode , countryCode != "" else {return}
        AuthServices.instance.veirfyOtp(countryCode: countryCode, mobileNo: mobileNo, Otp: verifyCode) { (sucess) in
            if sucess {
                print(AuthServices.instance.verifyCodeID)
                if AuthServices.instance.verifyCodeID != ""{
                    let storyboard = self.storyboard?.instantiateViewController(identifier: SELECTACCOUNTVC) as! SelectAccountVC
                    storyboard.mobileNo = mobileNo
                    self.navigationController?.pushViewController(storyboard, animated: true)
                }else{
            
                    let alert = UIAlertController(title: "Please Enter Correct OTP", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            //}else{
                print("Otp is wrong")
            }
        }
    }
    //    MARK:This function is used to pop View controller
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
//MARK:UitextField Delegate
extension PhoneSignUpOTPVC:UITextFieldDelegate{    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}


