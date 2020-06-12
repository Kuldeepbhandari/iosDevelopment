//
//  SelectHeightVC.swift
//  AppLumi
//
//  Created by appinventiv on 03/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire

class SelectHeightVC: UIViewController {
    
    @IBOutlet var iformationView: InformationView!
    @IBOutlet var setTitle: SetTitle!
    @IBOutlet var inchTableView: UITableView!
    @IBOutlet var feetTableView: UITableView!
    
    var feetArr = [1,2,3,4,5,6,7,8]
    var inchArr = [0,1,2,3,4,5,6,7,8,9,10,11,12]
    var selectFeet = Int()
    var selectInch = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inchTableView.delegate = self
        inchTableView.dataSource = self
        feetTableView.delegate = self
        feetTableView.dataSource = self
        setTitle.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        iformationView.heightImage.image = #imageLiteral(resourceName: "icProfileSetupHeightActive")
    }
    
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
//    MARK:This function is used to save data on server
    
    func saveDataOnServer(completion:@escaping CompletionHandler){
        let body : [String:Any] = ["feet":selectFeet,
                    "inches":selectInch
        ]
        AF.request(UPDATE_HEIGHT_URL, method: .put, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                completion(true)
            }else{
                debugPrint(response.error as Any)
                completion(false)
            }
        }
    }
    
    @IBAction func nextBtnWasTapped(_ sender: UIButton) {
        
        
        saveDataOnServer { (sucess) in
            if sucess{
                print("Height is saved")
                guard let selectAgeVc = self.storyboard?.instantiateViewController(withIdentifier: "SelectAgeVC") as? SelectAgeVC else {return}
                self.navigationController?.pushViewController(selectAgeVc, animated: true)
            }
        }
    }
    
    
   
    
}
extension SelectHeightVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count : Int?
        if tableView == self.feetTableView{
            count = feetArr.count
        }
        if tableView == self.inchTableView{
            count = inchArr.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.feetTableView{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FeetCell", for: indexPath) as? FeetCell{
                cell.labelFeet.text = "\(feetArr[indexPath.row])"
                return cell
            }
        }
        if tableView == self.inchTableView{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "InchCell", for: indexPath) as? InchCell{
                cell.labelInch.text = "\(inchArr[indexPath.row])"
                return cell
            }
        }else{
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.feetTableView{
             selectFeet = feetArr[indexPath.row]
            print(selectFeet)
        }
        if tableView == self.inchTableView{
            selectInch = inchArr[indexPath.row]
            print(selectInch)
        }
    }
    
}
