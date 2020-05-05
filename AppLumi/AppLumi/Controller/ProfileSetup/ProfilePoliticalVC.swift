//
//  ProfilePoliticalVC.swift
//  AppLumi
//
//  Created by appinventiv on 20/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class ProfilePoliticalVC: UIViewController {
    
    @IBOutlet var preferNotToSayBtn: UIButton!
    @IBOutlet var otherBtn: UIButton!
    @IBOutlet var consertiveBtn: UIButton!
    @IBOutlet var moderateBtn: UIButton!
    @IBOutlet var liberalBtn: UIButton!
    @IBOutlet var titleView: SetTitle!
    @IBOutlet var newView: SetUpAlcoholView!
    
    //    MARK:Varaibles
    
    var selectTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
    }
    
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
   //    MARK:This function is used for set Default color of button
    func setButtonColorAndText(){
        self.preferNotToSayBtn.backgroundColor = AppColors.defaultColor
        self.preferNotToSayBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.otherBtn.backgroundColor = AppColors.defaultColor
        self.otherBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.consertiveBtn.backgroundColor = AppColors.defaultColor
        self.consertiveBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.moderateBtn.backgroundColor = AppColors.defaultColor
        self.moderateBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.liberalBtn.backgroundColor = AppColors.defaultColor
        self.liberalBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
    }
    @IBAction func chooseOptionBtnWasPressed(_ sender: UIButton) {
        setButtonColorAndText()
        sender.backgroundColor = AppColors.selectBtn
        sender.setTitleColor(AppColors.selectTitleColor, for: .normal)
        if sender.tag == 1{
            if let title = sender.titleLabel?.text{
                selectTitle = title
                
            }
        }else if sender.tag == 2{
            if let title = sender.titleLabel?.text{
                selectTitle = title
            }
        } else if sender.tag == 3{
            if let title = sender.titleLabel?.text{
                selectTitle = title
            }
        }else if sender.tag == 4{
            if let title = sender.titleLabel?.text{
                selectTitle = title
            }
        }else if sender.tag == 5{
            if let title = sender.titleLabel?.text{
                selectTitle = title
                
            }
        }
    }
    
    //MARK:This function is used to go to next Screen
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        print(selectTitle)
        if selectTitle != ""{
            AuthServices.instance.updateDataOnServer(dict: ["political_learning":selectTitle], url: UPDATE_POLITICAL_URL) { (sucees) in
                if sucees{
                        let setupGender = self.storyboard?.instantiateViewController(identifier: profileSetupGender) as! ProfileSetupGender
                        self.navigationController?.pushViewController(setupGender, animated: true)
                }
            }
        }else{
            let alert = UIAlertController(title: "Plesae Select Any One Options ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        
    }
    
}
