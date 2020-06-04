//
//  PaymentVC.swift
//  AppLumi
//
//  Created by mac on 07/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire

class PaymentVC: UIViewController {
    
    @IBOutlet weak var cvvText: UITextField!
    @IBOutlet weak var amounttext: UITextField!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var cardNo : String?
    var cardName:String?
    var userName:String?
    var eventId : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetup()
    }
    
    func initalSetup(){
        amounttext.text = "1600"
        cardNumberLabel.text = cardNo!
        nameLabel.text = userName
        cvvText.delegate = self
        amounttext.delegate = self
    }
    

    @IBAction func payBtnWasTapped(_ sender: UIButton) {
        
        savePaymentInformation { (sucess) in
            if sucess{
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
    @IBAction func backBtnWasTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func savePaymentInformation(completion:CompletionHandler){
        guard let eventId = eventId , let cardNumber = cardNo , let cvv = cvvText.text , cvvText.text != "" else {return}
        
        let body : [String:Any] = [ "event_id":eventId,
                                    "card_no":cardNumber,
                                    "cvv":cvv
            
        ]
        AF.request(BOOKING_PAYMENT_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                print(response.value)
            }else{
                debugPrint(response.error?.localizedDescription)
            }
        }
    }
}

extension PaymentVC:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
