//
//  SelectReligionVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 14/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SelectReligionVC: UIViewController {
    
    @IBOutlet var btnPreferNotSay: UIButton!
    @IBOutlet var btnNone: UIButton!
    @IBOutlet var btnOther: UIButton!
    @IBOutlet var btnHinduism: UIButton!
    @IBOutlet var btnIslam: UIButton!
    @IBOutlet var btnJudaism: UIButton!
    @IBOutlet var btnChristianity: UIButton!
    @IBOutlet var btnBuddhism: UIButton!
    @IBOutlet var educationVIew: EducationView!
    @IBOutlet var setTitle: SetTitle!
    
    //    MARK:Variables
    var selectedTitle = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        educationVIew.religionImage.image = #imageLiteral(resourceName: "icProfileSetupReligionActive")
        
    }
//    MARK:This function is used to set Default color of Button
    func setBtnBackgroundColor(){
        self.btnPreferNotSay.backgroundColor = AppColors.defaultColor
        self.btnPreferNotSay.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.btnNone.backgroundColor = AppColors.defaultColor
        self.btnNone.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.btnOther.backgroundColor = AppColors.defaultColor
        self.btnOther.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.btnHinduism.backgroundColor = AppColors.defaultColor
        self.btnHinduism.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.btnIslam.backgroundColor = AppColors.defaultColor
        self.btnIslam.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.btnJudaism.backgroundColor = AppColors.defaultColor
        self.btnJudaism.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.btnChristianity.backgroundColor = AppColors.defaultColor
        self.btnChristianity.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.btnBuddhism.backgroundColor = AppColors.defaultColor
        self.btnBuddhism.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        
    }
    
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func chooseAnyOptionBtnWasPressed(_ sender: UIButton) {
        setBtnBackgroundColor()
        sender.backgroundColor = AppColors.selectBtn
        sender.setTitleColor(AppColors.selectTitleColor, for: .normal)
    
        if sender.tag == 1{
            if let title = sender.titleLabel?.text {
                selectedTitle = title
            }
        }else if sender.tag == 2{
            if let title = sender.titleLabel?.text {
                selectedTitle = title
            }
        }else if sender.tag == 3{
            if let title = sender.titleLabel?.text {
                selectedTitle = title
            }
        }else if sender.tag == 4{
            if let title = sender.titleLabel?.text {
                selectedTitle = title
            }
        }else if sender.tag == 5{
            if let title = sender.titleLabel?.text {
                selectedTitle = title
            }
        }else if sender.tag == 6{
            if let title = sender.titleLabel?.text {
                selectedTitle = title
            }
        }else if sender.tag == 7{
            if let title = sender.titleLabel?.text {
                selectedTitle = title
            }
        }else if sender.tag == 8{
            if let title = sender.titleLabel?.text {
                selectedTitle = title
            }
        }
    }
    
    
    
    @IBAction func nextBtnWasPreseed(_ sender: Any) {
        print(selectedTitle)
        if selectedTitle != ""{
            AuthServices.instance.updateDataOnServer(dict: ["religion":selectedTitle], url: UPDATE_RELIGION_URL) { (sucess) in
                if sucess{
                    print("Data is saved")
                        guard let ciggrateVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectCigaretteVC") as? SelectCigaretteVC else {return}
                        self.navigationController?.pushViewController(ciggrateVC, animated: true)
                }
            }
        }else{
            let alert = UIAlertController(title: "Plesae Select Any One Options ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }    
}
