//
//  ProfileSetupBio+AnswerVC.swift
//  AppLumi
//
//  Created by appinventiv on 08/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class ProfileSetupBio_AnswerVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var titleView: SetTitle!
    @IBOutlet var informationView: InformationView!
    
    //     MARK:Variables
    
    var answers = String()
    var selectId = Int()
    var body : [String:Any]?
    
    //    MARK:View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    
    //    MARK:Intial Setup of view controller
    internal func initialSetup(){
        tableView.delegate = self
        tableView.dataSource = self
        self.titleView.backBtn.addTarget(self, action: #selector(dismissView(_ :)), for: .touchUpInside)
        AuthServices.instance.getQuestionsList { (sucess) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        informationView.bioImage.image = #imageLiteral(resourceName: "icProfileSetupBioActive")
    }
    
    
    @objc func dismissView(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtnWasPressed(_ sender: UIButton) {
        guard let drugVC = self.storyboard?.instantiateViewController(withIdentifier: "SetupEducationVC") as? SetupEducationVC else {return}
        self.navigationController?.pushViewController(drugVC, animated: true)
        
    }
}


extension ProfileSetupBio_AnswerVC:UITableViewDelegate,UITableViewDataSource{
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AuthServices.instance.getQuetionsArr.count
    }
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as? AnswerCell {
            if AuthServices.instance.getQuetionsArr[indexPath.row].Q_id == 1{
//                selectId = AuthServices.instance.getQuetionsArr[indexPath.row].Q_id
                print("The question id is \(AuthServices.instance.getQuetionsArr[indexPath.row].Q_id)")
                if let answer = cell.answerTextView.text, cell.answerTextView.text != "Enter Your Answer Here" {
                    answers = answer
                }
//                body = [ "answer":answers,
//                         "Q_id":selectId
//                ]
                cell.containerView.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 230/255, alpha: 1)
                cell.answerBtn.backgroundColor = UIColor(red: 252/255, green: 174/255, blue: 48/255, alpha: 1)
                cell.addBtn.backgroundColor = UIColor(red: 252/255, green: 174/255, blue: 48/255, alpha: 1)
            }else if AuthServices.instance.getQuetionsArr[indexPath.row].Q_id == 2{
               // selectId = AuthServices.instance.getQuetionsArr[indexPath.row].Q_id
                print("The question id is \(AuthServices.instance.getQuetionsArr[indexPath.row].Q_id)")

                if let answer = cell.answerTextView.text, cell.answerTextView.text != "Enter Your Answer Here" {
                    answers = answer
                }
//                body = [ "answer":answers,
//                         "Q_id":selectId
//                ]
                cell.containerView.backgroundColor = UIColor(red: 246/255, green: 235/255, blue: 255/255, alpha: 1)
                cell.answerBtn.backgroundColor = UIColor(red: 161/255, green: 88/255, blue: 223/255, alpha: 1)
                cell.addBtn.backgroundColor = UIColor(red: 161/255, green: 88/255, blue: 223/255, alpha: 1)
            }else if AuthServices.instance.getQuetionsArr[indexPath.row].Q_id == 3{
                print("The question id is \(AuthServices.instance.getQuetionsArr[indexPath.row].Q_id)")

               // selectId = AuthServices.instance.getQuetionsArr[indexPath.row].Q_id
                if let answer = cell.answerTextView.text, cell.answerTextView.text != "Enter Your Answer Here" {
                    answers = answer
                }
                
//                body = [ "answer":answers,
//                         "Q_id":selectId
//                ]
                cell.containerView.backgroundColor = UIColor(red: 233/255, green: 243/255, blue: 255/255, alpha: 1)
                cell.answerBtn.backgroundColor = UIColor(red: 81/255, green: 156/255, blue: 250/255, alpha: 1)
                cell.addBtn.backgroundColor = UIColor(red: 81/255, green: 156/255, blue: 250/255, alpha: 1)
            }else if AuthServices.instance.getQuetionsArr[indexPath.row].Q_id == 4{
               // selectId = AuthServices.instance.getQuetionsArr[indexPath.row].Q_id
                print("The question id is \(AuthServices.instance.getQuetionsArr[indexPath.row].Q_id)")

                if let answer = cell.answerTextView.text, cell.answerTextView.text != "Enter Your Answer Here" {
                    answers = answer
                }
                
//                body = [ "answer":answers,
//                         "Q_id":selectId
//                ]
                
                cell.containerView.backgroundColor = UIColor(red: 228/255, green: 255/255, blue: 241/255, alpha: 1)
                cell.answerBtn.backgroundColor = UIColor(red: 0/255, green: 208/255, blue: 104/255, alpha: 1)
                cell.addBtn.backgroundColor = UIColor(red: 0/255, green: 208/255, blue: 104/255, alpha: 1)
            }
            cell.lblQuestions.text = AuthServices.instance.getQuetionsArr[indexPath.row].question
            
            cell.addBtnTapped = {
                if cell.answerTextView.text == ""{
                    let alert = UIAlertController(title: "Your Answer Can't be empty", message: "Ok", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert, animated: false, completion: nil)
                }else{
                    
                    let id = AuthServices.instance.getQuetionsArr.map({$0.Q_id })
//                    let body = [
//                        "answer":cell.answerTextView.text,
//                        "Q_id" : id.filter({$0.})
//                    ]
                    cell.btnStackView.isHidden = true
                    cell.viewAnswer.isHidden = true
                    cell.answerStackView.isHidden = true
                    cell.stackView.isHidden = true
                    cell.answerLabel.isHidden = false
                    self.sendAnswerData { (sucess) in
                        if sucess{
                            cell.answerLabel.isHidden = false
                            print("Your answer is saved on the server")
                            cell.answerLabel.text = cell.answerTextView.text
                            print("The saved answer is \(String(describing: cell.answerLabel.text))")
                            DispatchQueue.main.async {
                                tableView.reloadData()
                            }
                        }
                    }
                }
            }
            cell.answerBtnTapped = {
                cell.btnStackView.isHidden = false
                cell.viewAnswer.isHidden = false
                cell.answerTextView.isHidden = false
                cell.answerLabel.isHidden = true
                cell.answerBtn.isHidden = true
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            }
            cell.cancelBtnTapped = {
                cell.viewAnswer.isHidden = true
                cell.btnStackView.isHidden = true
                cell.answerLabel.isHidden = true
                cell.answerBtn.isHidden = false
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            }
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
//    MARK:This function is used to save the answer in server
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index  = indexPath.row+1
        print(index)
    }
    
    func sendAnswerData(completion:@escaping CompletionHandler){
        print(body)
        AF.request(ANSWER_BIO_QUESTIONS, method: .put, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                print(response.value!)
                completion(true)
            }else{
                debugPrint(response.error as Any)
                completion(false)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
    
}

extension UIView{
    var tableViewCell : UITableViewCell?{
        var superViewObject = superview
        while !(superViewObject is UITableViewCell) {
            guard let view = superViewObject?.superview else {return nil}
            superViewObject = view
        }
        return superViewObject as? UITableViewCell
        
    }
}
