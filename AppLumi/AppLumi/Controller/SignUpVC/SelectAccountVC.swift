//
//  SelectAccountVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 25/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SelectAccountVC: UIViewController {
    
    //    MARK:Variables
    
    var mobileNo : String!
    var message = ""
    
    //    MARK:Controller Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    //   MARK:This function is used to veify account a account is either exist or not .
    func verifyAccount(compeletion:@escaping CompletionHandler){
            guard let mobileNo = mobileNo else {return}
        print("\(mobileNo)")
        let url = "\(CHECK_EXISTING_ACCOUNT)\(mobileNo)"
        print(url)
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON {  (response) in
            if response.error == nil{
                guard let data = response.data else {return}
                do{
                    guard let json = try JSON(data: data).dictionaryObject else {return}
                    for  (key,value) in json{
                        print("\(key) and \(value)")
                        self.message = json["message"] as? String ?? ""
                        
                    }
                    print("messega is \(self.message)")
                    compeletion(true)
                    
                }catch{
                    print(error.localizedDescription)
                }
            }else{
                debugPrint(response.error as Any)
                compeletion(false)
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
        verifyAccount { (sucess) in
            if sucess{
                if  self.message == "user found!"{
                    self.existingAlertController()
                }else{
                    let profileOverviewVc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileSetupOverview") as! ProfileSetupOverview
                    self.navigationController?.pushViewController(profileOverviewVc, animated: true)
                }
            }
        }
    }
    
    
    //    MARK:This function is used to check either account is exist or not
    @IBAction func linkAnExistingAccountBtnWasTapped(_ sender: UIButton) {
        verifyAccount { (sucess) in
            if sucess{
                if  self.message == "user found!"{
                    guard let settingVc = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as? MenuVC else {return}
                    self.navigationController?.pushViewController(settingVc, animated: true)
                }else{
                    self.createNewAccountAlertController()
                }
            }
        }
    }
}
