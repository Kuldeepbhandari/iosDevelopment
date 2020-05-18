//
//  SelectAccountVC.swift
//  AppLumi
//
//  Created by appinventiv on 25/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire

class SelectAccountVC: UIViewController {
    
//    MARK:Variables
    
    var mobileNo : String!
    
    //    MARK:Controller Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        verifyAccount { (sucees) in
            print("sucess")
        }
    }
    
//   MARK:This function is used to veify account a account is either exist or not .
    func verifyAccount(completions:@escaping CompletionHandler){
        guard let mobileNo = mobileNo else {return}
        let url = "\(CHECK_EXISTING_ACCOUNT)\(mobileNo)"
        print(url)
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON {  (response) in
            if response.error == nil{
                print(response.value)
                completions(true)
            }else{
                debugPrint(response.error as Any)
                completions(false)
            }
        }
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
//    MARK:This function is used to open a alert box if our account is allready exist
    
    func existingAlertController(){
        let alertControoler = UIAlertController(title: "Your Account Is Allready Exist", message: "Please click on existing account", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertControoler.addAction(okAction)
        self.present(alertControoler, animated: true, completion: nil)
    }
//    MARK:This function is used to open a alert box if our account is not created
    
    func createNewAccountAlertController(){
        let alertControoler = UIAlertController(title: "Your Account is not exist", message: "Please click on create new account", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertControoler.addAction(okAction)
        self.present(alertControoler, animated: true, completion: nil)
    }
//    MARK:This function is used to create a new account
    @IBAction func tappedOnCreateNewAccount(_ sender: UIButton) {
        
        verifyAccount { (suceess) in
            if suceess{
                self.existingAlertController()
            }else{
                let profileOverviewVc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileSetupOverview") as! ProfileSetupOverview
                self.navigationController?.pushViewController(profileOverviewVc, animated: true)
            }
        }
    }
    
//    MARK:This function is used to check either account is exist or not
    @IBAction func linkAnExistingAccountBtnWasTapped(_ sender: UIButton) {
        verifyAccount { (sucess) in
            if sucess{
                guard let settingVc = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as? MenuVC else {return}
                self.navigationController?.pushViewController(settingVc, animated: true)
            }else{
                self.createNewAccountAlertController()
            }
        }
    }
}
