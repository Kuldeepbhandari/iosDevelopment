//
//  ProfileSetUpDrugs.swift
//  AppLumi
//
//  Created by appinventiv on 20/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class ProfileSetUpDrugs: UIViewController {
    
    @IBOutlet var preferNotToSay: UIButton!
    @IBOutlet var noBtn: UIButton!
    @IBOutlet var sometimesBtn: UIButton!
    @IBOutlet var yesBtn: UIButton!
    @IBOutlet var titleView: SetTitle!
    @IBOutlet var alcoholView: SetUpAlcoholView!
    
    //    MARK:Variables
    var selectTitle = String()
    let buttonTags = [1,2,3,4]
    var isBtnSelect = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        alcoholView.durgImage.image = #imageLiteral(resourceName: "icProfileSetupDrugsActive")
    }
    
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //    MARK:This function is used for set Default color of button
    func setButtonColorAndText(){
        self.preferNotToSay.backgroundColor = AppColors.defaultColor
        self.preferNotToSay.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.noBtn.backgroundColor = AppColors.defaultColor
        self.noBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.sometimesBtn.backgroundColor = AppColors.defaultColor
        self.sometimesBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.yesBtn.backgroundColor = AppColors.defaultColor
        self.yesBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
    }
    @IBAction func selectOptionBtnWasTapped(_ sender: UIButton) {
        setButtonColorAndText()
        sender.backgroundColor = AppColors.selectBtn
        sender.setTitleColor(AppColors.selectTitleColor, for: .normal)
        if sender.tag == 1{
            sender.setTitleColor(AppColors.selectTitleColor, for: .normal)
            sender.backgroundColor = AppColors.selectBtn
            if let title = sender.titleLabel?.text{
                selectTitle = title
            }
        }else if sender.tag == 2{
            if let title = sender.titleLabel?.text{
                selectTitle = title
            }
        }else if sender.tag == 3{
            if let title = sender.titleLabel?.text{
                selectTitle = title
            }
        }else if sender.tag == 4{
            if let title = sender.titleLabel?.text{
                selectTitle = title
            }
        }
    }
    
    //MARK:This function is used to go to next Screen
    @IBAction func tappedOnNextBtn(_ sender: Any) {
        print(selectTitle)
        if selectTitle != ""{
            AuthServices.instance.updateDataOnServer(dict: ["drug_info":selectTitle], url: UPDATE_PROFILE_DRUGS_URL) { (sucess) in
                if sucess{
                    let profilePolticalVc = self.storyboard?.instantiateViewController(identifier: profilePoliticalVC) as! ProfilePoliticalVC
                    self.navigationController?.pushViewController(profilePolticalVc, animated: true)
                }
            }
        }else{
            let alert = UIAlertController(title: "Plesae Select Any One Options ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}



