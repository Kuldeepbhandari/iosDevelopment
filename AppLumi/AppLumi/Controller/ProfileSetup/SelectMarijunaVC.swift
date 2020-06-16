//
//  SelectMarijunaVC.swift
//  AppLumi
//
//  Created by appinventiv on 14/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SelectMarijunaVC: UIViewController {
    
    @IBOutlet var preferNotToSayBtn: UIButton!
    @IBOutlet var noSometimes: UIButton!
    @IBOutlet var someTimesBtn: UIButton!
    @IBOutlet var yesBtn: UIButton!
    @IBOutlet var alcoholView: SetUpAlcoholView!
    @IBOutlet var setTitle: SetTitle!
    
    //MARK:Variables
    var selectTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        alcoholView.marijunaImage.image = #imageLiteral(resourceName: "icProfileSetupMarijuanaActive")
        
    }
    
    func setBtnBackgroundColor(){
        self.preferNotToSayBtn.backgroundColor = AppColors.defaultColor
        self.preferNotToSayBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.noSometimes.backgroundColor = AppColors.defaultColor
        self.noSometimes.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.someTimesBtn.backgroundColor = AppColors.defaultColor
        self.someTimesBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.yesBtn.backgroundColor = AppColors.defaultColor
        self.yesBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        
    }
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func chooseOptionBtnWasPressed(_ sender: UIButton) {
        setBtnBackgroundColor()
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
    @IBAction func nextBtnWasPressed(_ sender: UIButton) {
        
        if selectTitle != ""{
            AuthServices.instance.updateDataOnServer(dict: ["Marijuana":selectTitle], url: UPDATE_DRUGS_URL) { (sucees) in
                if sucees{
                        guard let selectHeightVc = self.storyboard?.instantiateViewController(withIdentifier: "JobTititleVC") as? JobTititleVC else {return}
                        self.navigationController?.pushViewController(selectHeightVc, animated: true)
                }
            }
        }else{
            let alert = UIAlertController(title: "Plesae Select Any One Options ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
