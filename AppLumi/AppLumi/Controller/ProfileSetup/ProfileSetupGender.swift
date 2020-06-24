//
//  ProfileSetupGender.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 20/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class ProfileSetupGender: UIViewController {
    
    @IBOutlet var genderFluidBtn: UIButton!
    @IBOutlet var menAndWomenBtn: UIButton!
    @IBOutlet var womenBtn: UIButton!
    @IBOutlet var menBtn: UIButton!
    @IBOutlet var titleView: SetTitle!
    @IBOutlet var informationView: InformationView!
    
    //    MARK:variables
    
    var selectTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        informationView.genderImage.image = #imageLiteral(resourceName: "icProfileSetupGenderActive")
    }
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    //    MARK:This function is used for set Default color of button
    func setButtonColorAndText(){
         self.genderFluidBtn.backgroundColor = AppColors.defaultColor
               self.genderFluidBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
               self.menAndWomenBtn.backgroundColor = AppColors.defaultColor
               self.menAndWomenBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
               self.womenBtn.backgroundColor = AppColors.defaultColor
               self.womenBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
               self.menBtn.backgroundColor = AppColors.defaultColor
               self.menBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
    }
    @IBAction func chooseOptionBtnSelect(_ sender: UIButton) {
        setButtonColorAndText()
        
        sender.backgroundColor = AppColors.selectBtn
        sender.setTitleColor(AppColors.selectTitleColor, for: .normal)
        if sender.tag == 1{
            if let title = sender.titleLabel?.text {
                selectTitle = title
            }
        }else if sender.tag == 2{
            if let title = sender.titleLabel?.text {
                selectTitle = title
            }
        }else if sender.tag == 3{
            if let title = sender.titleLabel?.text {
                selectTitle = title
            }
        }else if sender.tag == 4{
            if let title = sender.titleLabel?.text {
                selectTitle = title
            }
        }
        
    }
    
    //MARK:This function is used to go to next Screen
    @IBAction func tappedOnNextBtn(_ sender: UIButton) {
        print(selectTitle)
        if selectTitle != ""{
            AuthServices.instance.updateDataOnServer(dict: ["interested_gender":selectTitle], url: UPDATE_GENDER_URL) { (sucess) in
                if sucess{
                        let setUpAlocohol = self.storyboard?.instantiateViewController(identifier: setupAlcoholVC) as! SetupAlcoholVC
                        self.navigationController?.pushViewController(setUpAlocohol, animated: true)
                }
            }
        }else{
            let alert = UIAlertController(title: "Plesae Select Any One Options ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
    }
    
}
