//
//  GetSavedCardsVC.swift
//  AppLumi
//
//  Created by mac on 06/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GetSavedCardsVC: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveInfoBtn: UIButton!
    @IBOutlet weak var cvvTextF: UITextField!
    @IBOutlet weak var expirayYearText: UITextField!
    @IBOutlet weak var expirayMonthTexxt: UITextField!
    @IBOutlet weak var cardNoTextField: UITextField!
    
    //    MARK:variables
    
    var savedCard = [Card]()
    var name:String?
    var eventId : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSetup()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func openPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
    }
    func intialSetup(){
        cvvTextF.delegate = self
        expirayYearText.delegate = self
        expirayMonthTexxt.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        getSavedCardDetails { (sucess) in
            if sucess{
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        cardNoTextField.delegate = self
        
    }
    //    MARK:This function is used to get the details of saved cards from server
    
    func getSavedCardDetails(completion:@escaping CompletionHandler){
        AF.request(GET_SAVED_CARD_DETAILS_URL, method: .get, parameters: nil, encoding:URLEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                let data = response.value as! Dictionary<String,Any>
                print(data)
                guard let cardsData = data["cards"] as? [Dictionary<String,Any>] else {return}
                for key in cardsData{
                    let cardName = key["card_name"] as? String
                    let cvv = key["cvv"] as? String
                    let cardNumber = key["cardNumber"] as? String
                    let name = key["name"] as? String
                    let gateway = key["gateway"] as? String
                    let type = key["type"] as? String
                    let expiryData = key["expiry_date"] as! Dictionary<String,Any>
                    print(expiryData)
                    let month = expiryData["month"] as? Int
                    let year = expiryData["year"] as? Int
                    let card = Card(expiry_date: ExpiryDate(month: month ?? 0, year: year ?? 0), cardNumber: cardNumber ?? "", card_name: cardName ?? "", cvv: cvv ?? "", gateway: gateway ?? "", name: name ?? "", type: type ?? "")
                    self.savedCard.append(card)
                }
                print(self.savedCard.count)
                completion(true)
            }else{
                debugPrint(response.error?.localizedDescription as Any)
                completion(false)
            }
            
        }
    }
    //    MARK:Save card info button was tappped
    @IBAction func saveInfoBtnWasTapped(_ sender: UIButton) {
        saveCardDetails { (sucess) in
            if sucess{
                print("card is saved")
                self.getSavedCardDetails { (sucess) in
                    if sucess{
                        self.tableView.reloadData()
                        print("The card is append on table view")
                    }
                }
            }
        }
    }
    
    @IBAction func backBtnWasTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //    MARK:This function is used to save the card details in a from future transation
    
    func saveCardDetails(completion:@escaping CompletionHandler){
        saveInfoBtn.setImage(#imageLiteral(resourceName: "icRadioActive"), for: .normal)
        guard let cardNo = cardNoTextField.text , cardNoTextField.text != "" else {return}
        guard let userName = userNameTextField.text , userNameTextField.text != "" else {return}
        guard let cvv = cvvTextF.text , cvvTextF.text != "" else {return}
        guard let expirayYear = expirayYearText.text , expirayYearText.text != "" else {return}
        guard let expiryMonth = expirayMonthTexxt.text , expirayMonthTexxt.text != "" else {return}
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
    
    //     MARK:This function is used to when user first time use the card
    @IBAction func generalpaymentBtnWastapped(_ sender: UIButton) {
        payFirstTimeUser { (sucees) in
            if sucees{
                let alertController = UIAlertController(title: "Payment Suucess", message: "Conguraltion", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }else{
                let alertController = UIAlertController(title: "Payment is not complete", message: "", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                    self.dismiss(animated: true, completion: nil)
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    func payFirstTimeUser(completion:@escaping CompletionHandler){
        guard let cardNo = cardNoTextField.text , cardNoTextField.text != "" else {return}
        guard let userName = userNameTextField.text , userNameTextField.text != "" else {return}
        guard let cvv = cvvTextF.text , cvvTextF.text != "" else {return}
        guard let expirayYear = expirayYearText.text , expirayYearText.text != "" else {return}
        guard let expiryMonth = expirayMonthTexxt.text , expirayMonthTexxt.text != "" , let eventId = eventId else {return}
        
        let body : [String:Any] = [ "card_name":"Sbi Card",
                                    "name":userName,
                                    "expiry_date":[ "month":expiryMonth,
                                                    "year":expirayYear
            ],
                                    "cardNumber":cardNo,
                                    "cvv":cvv,
                                    "type":"debit",
                                    "event_id":eventId
        ]
        AF.request(GENRAL_PAYMENT_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                print(response.value)
                completion(true)
            }else{
                debugPrint(response.error?.localizedDescription)
                completion(false)
            }
        }
    }
}
//MARK:Uitableview delegate and datasource methods
extension GetSavedCardsVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countArr = savedCard.isEmpty ? 0 : savedCard.count
        return countArr
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCardTableCell") as? SavedCardTableCell else {return UITableViewCell()}
        if savedCard.isEmpty{
            return UITableViewCell()
        }else{
            
            cell.cardNameLbl.text = savedCard[indexPath.row].card_name
            cell.cardNoLabel.text = savedCard[indexPath.row].cardNumber
            name = savedCard[indexPath.row].name
            
            cell.savedCardBtn.addTarget(self, action: #selector(openPaymentVC), for: .touchUpInside)
            return cell
        }
    }
    
    //    MARK:This function is used to payment vc
    @objc func openPaymentVC(sender:UIButton){
        let buttonPositon = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPositon)
        let cell = self.tableView.cellForRow(at: indexPath!) as! SavedCardTableCell
        guard let paymentVC = self.storyboard?.instantiateViewController(withIdentifier: "PaymentVC") as? PaymentVC else {return}
        paymentVC.cardNo = cell.cardNoLabel.text
        paymentVC.cardName = cell.cardNameLbl.text
        paymentVC.eventId = eventId
        paymentVC.userName = name
        self.navigationController?.pushViewController(paymentVC, animated: true)
    }
}


//MARK:Uitextfield delegate methods

extension GetSavedCardsVC:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == cardNoTextField{
            let text = (cardNoTextField.text! as NSString).replacingCharacters(in: range, with: string)
            let count = text.count
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
            
        }else if textField == expirayMonthTexxt{
            guard let preText = textField.text as NSString?,
                preText.replacingCharacters(in: range, with: string).count < 3 else {
                    return false
            }
            return true
        }
        else if textField == expirayYearText{
            guard let preText = textField.text as NSString?,
                preText.replacingCharacters(in: range, with: string).count < 5 else {
                    return false
            }
            return true
        }
        else if textField == cvvTextF{
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


extension GetSavedCardsVC:UIPickerViewDelegate{
    
}
