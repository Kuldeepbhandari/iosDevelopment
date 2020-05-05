//
//  JobTititleVC.swift
//  AppLumi
//
//  Created by appinventiv on 24/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class JobTititleVC: UIViewController ,UITextFieldDelegate{

    @IBOutlet var selectJobTitle: UITextField!
    @IBOutlet var setTitle: SetTitle!
    @IBOutlet var educationView: EducationView!
    
//    MARK:Variables
    
    var jobTitleArr = [String]()
    var selectTitle:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        setTitle.backBtn.addTarget(self, action: #selector(popView), for: .touchUpInside)
        getJobTitle { (sucees) in
            print("i get the data")
        }
        selectJobTitle.delegate = self
        createPickerView()
        educationView.jobImage.image = #imageLiteral(resourceName: "icProfileSetupJobActive")
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
//    MARK:This function is used to get list of employye from Server
    func getJobTitle(completion:@escaping CompletionHandler){
        AF.request(GET_JOB_TITLE_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                guard let data = response.data else {return}
                do{
                    let json = try JSON(data: data).dictionary
                    let jsonArr = json?["list"]?.array
                    for item in jsonArr!{
                        self.jobTitleArr.append(item.stringValue)
                    }
                    print(self.jobTitleArr)
                completion(true)
                }catch{
                    print(error.localizedDescription)
            }
            }
            else{
                debugPrint(response.error as Any)
                completion(false)
            }
        }
    }
    
    @objc func popView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func createPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        selectJobTitle.inputView = pickerView
        
    }
    
    @IBAction func openJobListTitle(_ sender: Any) {
    }
    
    @IBAction func nextBtnWasPressed(_ sender: UIButton) {
        guard let title = selectJobTitle.text , selectJobTitle.text != "" else {return}
        let selectedTitle = title
        AF.request(PUT_JOB_TITLE_URL, method: .put, parameters: ["jobTitle":selectedTitle], encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                    guard let selectAge = self.storyboard?.instantiateViewController(withIdentifier: "SelectHeightVC") as? SelectHeightVC else {return}
                    self.navigationController?.pushViewController(selectAge, animated: true)
            }
        }
    }
}


//MARK:UIPickerView Delegate and Datasource

extension JobTititleVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jobTitleArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jobTitleArr[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectTitle = jobTitleArr[row]
        selectJobTitle.text = selectTitle
    }
    
}
