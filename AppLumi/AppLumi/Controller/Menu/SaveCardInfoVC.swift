//
//  SaveCardInfoVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 21/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire


class SaveCardInfoVC: UIViewController {

    @IBOutlet var savedInfoBtn: UIButton!
    @IBOutlet var cvvTF: UITextField!
    @IBOutlet var expiaryYearTF: UITextField!
    @IBOutlet var expiryMonthText: UITextField!
    @IBOutlet var cardNoTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
    var flag = false
    var eventId:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInitalView()
    }
    
    
    private func setUpInitalView(){
        cvvTF.delegate = self
        expiryMonthText.delegate = self
        expiaryYearTF.delegate = self
        cardNoTextField.delegate = self
        nameTextField.delegate = self
        
    }

    @IBAction func backBtnWasPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func savedCardInfoBtnWasPressed(_ sender: UIButton) {
        if flag == false{
            savedInfoBtn.setImage(#imageLiteral(resourceName: "icRadioInactive"), for: .normal)
            flag = true
        }else if flag == true{
            savedInfoBtn.setImage(#imageLiteral(resourceName: "icAddImg"), for: .normal)
        }
        
        saveCardDetails { (sucees) in
            if sucees{
                print("card details is saved")
               guard let getSavedCardVc = self.storyboard?.instantiateViewController(withIdentifier: "GetSavedCardsVC") as? GetSavedCardsVC else {return}
                getSavedCardVc.eventId = self.eventId
                self.navigationController?.pushViewController(getSavedCardVc, animated: true)
            }
        }
    }
    
    func saveCardDetails(completion:@escaping CompletionHandler){
        guard let cardNo = cardNoTextField.text , cardNoTextField.text != "" else {return}
        guard let userName = nameTextField.text , nameTextField.text != "" else {return}
        guard let cvv = cvvTF.text , cvvTF.text != "" else {return}
        guard let expirayYear = expiaryYearTF.text , expiaryYearTF.text != "" else {return}
        guard let expiryMonth = expiryMonthText.text , expiryMonthText.text != "" else {return}
        
        
        let body : [String:Any] = [ "card_name":"citi bank debit card",
                                    "name":userName,
                                    "expiry_date":[ "month":expiryMonth,
                                                    "year":expirayYear
                                                    ],
                                    "cardNumber":cardNo,
                                    "cvv":cvv,
                                    "type":"debit"
        ]
            
        AF.request(SAVED_CARD_DETAILS_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                print(response.value)
                completion(true)
            }else{
                debugPrint(response.error as Any)
                completion(false)
            }
        }
        
        
    }
    
   
}




//MARK:UItextfiled delegate

extension SaveCardInfoVC:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == cardNoTextField{
        let text = (cardNoTextField.text! as NSString).replacingCharacters(in: range, with: string)
        let count = text.count
        print(count)
        if string != "" {
        if count > 19
        {
            return false
        }
        if count % 5 == 0{
            cardNoTextField.text?.insert("-", at: String.Index.init(encodedOffset: count-1))
        }
        return true
      }
      return true
    }
            else if textField == expiryMonthText{
                guard let preText = textField.text as NSString?,
                    preText.replacingCharacters(in: range, with: string).count < 3 else {
                    return false
                }
                return true
            }
            else if textField == expiryMonthText{
                guard let preText = textField.text as NSString?,
                    preText.replacingCharacters(in: range, with: string).count < 5 else {
                    return false
                }
                return true
            }
            else if textField == cvvTF{
                guard let preText = textField.text as NSString?,
                    preText.replacingCharacters(in: range, with: string).count < 4 else {
                    return false
                }
                return true
            }
        else{
        return true
        }
    }
}
