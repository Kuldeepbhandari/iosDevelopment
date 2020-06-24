//
//  SettingVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 05/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire
class SettingVC: UIViewController {

    @IBOutlet weak var isEmailNotVerifiedImage: UIImageView!
    @IBOutlet weak var isEmailVerfiedImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnWasTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func openNextOptionBtnWasTapped(_ sender: UIButton) {
        if sender.tag == 1{
            //opne recovery email
            
        }else if sender.tag == 2{
            //open change password
            guard let chagnePasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC else {return}
            self.navigationController?.pushViewController(chagnePasswordVC, animated: true)
            
        }else if sender.tag == 3{
            //open my event ticket
            
        }else if sender.tag == 4{
            //open terms & conditions
            guard let termsAndCondtionsVC = self.storyboard?.instantiateViewController(withIdentifier: "TermsAndConditions") as? TermsAndConditions else {return}
            self.navigationController?.pushViewController(termsAndCondtionsVC, animated: true)
            
        }else if sender.tag == 5{ 
//            open faq
        }else if sender.tag == 6{
//            open about us
        }else if sender.tag == 7{
//           open privacy policy
        }else if sender.tag == 8{
//            open contact us
        }
        
    }
    
    @IBAction func logOutBtnWasTapped(_ sender: UIButton) {
        
        AF.request(LOGOUT_USER_URL, method: .put, parameters: nil, encoding: URLEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                print(response.value)
                let data = response.value as! Dictionary<String,Any>
                print(data)
                let sucess = data["status"] as? String
                if sucess == "SUCCESS"{
                    let alert = UIAlertController(title: "User Logout Successfully", message: "", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                        guard let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "SignUpPhoneVC") as? SignUpPhoneVC else {return}
                        self.navigationController?.pushViewController(storyboard, animated: true)
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                }
                
            }else{
                print(response.error?.localizedDescription as Any)
            }
        }
    }
    
}
