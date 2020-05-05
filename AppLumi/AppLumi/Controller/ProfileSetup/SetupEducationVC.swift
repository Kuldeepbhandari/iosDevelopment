//
//  SetupEducationVC.swift
//  AppLumi
//
//  Created by appinventiv on 20/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SetupEducationVC: UIViewController {
    
    @IBOutlet var preferNotToSayBtn: ToggleButton!
    @IBOutlet var postGraduateBtn: ToggleButton!
    @IBOutlet var undergraduateBtn: ToggleButton!
    @IBOutlet var highSchool: ToggleButton!
    @IBOutlet var titleView: SetTitle!
    @IBOutlet var educationView: EducationView!
    
    
 
    var selectTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        titleView.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        educationView.educationImage.image = #imageLiteral(resourceName: "icProfileSetupJobActive")
        
    }
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func setButtonColorAndText(){
        
        
    }
    
    @IBAction func selectEductionBtnWasPressed(_ sender: UIButton) {
        self.preferNotToSayBtn.backgroundColor = AppColors.defaultColor
        self.preferNotToSayBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.postGraduateBtn.backgroundColor = AppColors.defaultColor
        self.postGraduateBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.undergraduateBtn.backgroundColor = AppColors.defaultColor
        self.undergraduateBtn.setTitleColor(AppColors.defaultTitleColor, for: .normal)
        self.highSchool.backgroundColor = AppColors.defaultColor
        self.highSchool.setTitleColor(AppColors.defaultTitleColor, for: .normal)
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
    
    
    @IBAction func tappedNextBtn(_ sender: UIButton) {
        if selectTitle != ""{
            AuthServices.instance.updateDataOnServer(dict: ["highest_education":selectTitle], url: UPADTE_EDUCTAION_DETAIL_URL) { (sucees) in
                if sucees{
                    let answerStoryboard = self.storyboard?.instantiateViewController(identifier: "ProfileSetUpDrugs") as! ProfileSetUpDrugs
                    self.navigationController?.pushViewController(answerStoryboard, animated: true)
                    print("Data send ")
                }
            }
        }else{
            let alert = UIAlertController(title: "Plesae Select Any One Options ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
