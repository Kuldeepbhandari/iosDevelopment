//
//  SetupAlcoholVC.swift
//  AppLumi
//
//  Created by appinventiv on 20/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SetupAlcoholVC: UIViewController {
    
    @IBOutlet var preferNotToSayBtn: UIButton!
    @IBOutlet var noBtn: UIButton!
    @IBOutlet var sometimesBtn: UIButton!
    @IBOutlet var yesBtn: UIButton!
    @IBOutlet var titleView: SetTitle!
    @IBOutlet var alcoholVIew: SetUpAlcoholView!
    
    //    MARK:Variables
    var selectTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        titleView.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        alcoholVIew.alcoholmage.image = #imageLiteral(resourceName: "icProfileSetupAlcoholActive")
    }
    
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func setButtonColorAndText(){
           self.preferNotToSayBtn.backgroundColor = AppColors.defaultColor
               self.preferNotToSayBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
               self.noBtn.backgroundColor = AppColors.defaultColor
               self.noBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
               self.sometimesBtn.backgroundColor = AppColors.defaultColor
               self.sometimesBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
               self.yesBtn.backgroundColor = AppColors.defaultColor
               self.yesBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
           
    }
    
    @IBAction func selectOptionBtnWasPressed(_ sender: UIButton) {
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
        if selectTitle != ""{
            AuthServices.instance.updateDataOnServer(dict: ["alcohol_info":selectTitle], url: UPDATE_ALCOHOL_URL) { (sucess) in
                if sucess{
                        let setupEducation = self.storyboard?.instantiateViewController(identifier: "SelectReligionVC") as! SelectReligionVC
                        self.navigationController?.pushViewController(setupEducation, animated: true)
                    print("data is saved")
                }
            }
        }else{
            let alert = UIAlertController(title: "Plesae Select Any One Options ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
    }
}
