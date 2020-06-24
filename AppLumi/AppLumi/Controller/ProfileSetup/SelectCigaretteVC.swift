//
//  SelectCigaretteVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 14/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SelectCigaretteVC: UIViewController {
    
    @IBOutlet var btnPreferNotToSay: UIButton!
    @IBOutlet var btnNo: UIButton!
    @IBOutlet var btnSometimes: UIButton!
    @IBOutlet var yesBtn: UIButton!
    @IBOutlet var alcoholView: SetUpAlcoholView!
    @IBOutlet var setTitle: SetTitle!
    
    //MARK:Variables
    var selectedTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setTitle.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        alcoholView.ciggerateImage.image = #imageLiteral(resourceName: "icProfileSetupCigaretteActive")
        
    }
    func setBtnBackgroundColor(){
        self.btnPreferNotToSay.backgroundColor = AppColors.defaultColor
        self.btnPreferNotToSay.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.btnNo.backgroundColor = AppColors.defaultColor
        self.btnNo.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.btnSometimes.backgroundColor = AppColors.defaultColor
        self.btnSometimes.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.yesBtn.backgroundColor = AppColors.defaultColor
        self.yesBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        
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
        }
        
    }
    
    @IBAction func nextBtnWasTapped(_ sender: UIButton) {
        if selectedTitle != ""{
            AuthServices.instance.updateDataOnServer(dict: ["cigarettes":selectedTitle], url: UPDATE_SMOKING_URL) { (sucess) in
                if sucess{
                    guard let marijunaVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectMarijunaVC") as? SelectMarijunaVC else {return}
                    self.navigationController?.pushViewController(marijunaVC, animated: true)
                    print("Data is saved")
                }
            }
            
        }else{
            let alert = UIAlertController(title: "Plesae Select Any One Options ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}
