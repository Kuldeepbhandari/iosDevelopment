//
//  ProfileSetUpVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 20/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire

class SelectAgeVC: UIViewController {

    //MARK:Outlets
    @IBOutlet var selectAgeLbl: UILabel!
    @IBOutlet var maximumAgeLbl: UILabel!
    @IBOutlet var minimumAgeLbl: UILabel!
    @IBOutlet var titleVIew: SetTitle!
    @IBOutlet var newView: InformationView!
    
    
    let selectImage : SetUpImage! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleVIew.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        newView.ageImage.image = #imageLiteral(resourceName: "icProfileSetupAgeActive")
    
    }
    
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:This function is used to increase the slider value
    @IBAction func sliderAction(_ sender: UISlider) {
        selectAgeLbl.text = String(Int(sender.value))
    }
    //MARK:This function is used to go to next Screen
    @IBAction func tappedOnNextBtn(_ sender: Any) {
        
        submitUserDetails { (sucess) in
            if sucess{
                print("User detail is saved")
            }
        }
        guard let age = selectAgeLbl.text , selectAgeLbl.text != "" else {return}
        AuthServices.instance.updateDataOnServer(dict: ["max_age":age], url: UPDATE_AGE_URL) { (sucess) in
            if sucess{
                guard let myProfileVC = self.storyboard?.instantiateViewController(withIdentifier: "MyProfileVC") as? MyProfileVC else {return}
                self.navigationController?.pushViewController(myProfileVC, animated: true)
            }
            print("age is saved")
        }
    }
    
    
    func submitUserDetails(compeltion:@escaping CompletionHandler){
           AF.request(SAVE_USER_DETAILS_URL, method: .put, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
               if response.error == nil{
                print(response.value as Any)
                   compeltion(true)
               }else{
                   debugPrint(response.error?.localizedDescription as Any)
                   compeltion(false)
               }
           }
           
       }
    
}
