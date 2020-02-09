//
//  SecondVC.swift
//  ProtocalAndDelegate
//
//  Created by mac on 09/02/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

protocol DataPassProtocol {
    //func dataPass(name:String,address:String,city:String)
    //use dictionary if we pass multiple data then we will use dictionary
    func dataPassUsingDict(object:[String:String])
}
class SecondVC: UIViewController {

    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var textFiledAddress: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    var name:String? = nil
    var address:String? = nil
    var city:String? = nil
    var delegate:DataPassProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        textFiledAddress.text = address
        textFieldCity.text = city
        textFieldName.text = name
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveBtnTapped(_ sender: Any) {
       // delegate.dataPass(name: textFieldName.text!, address: textFiledAddress.text!, city: textFieldCity.text!)
        delegate.dataPassUsingDict(object: ["name":textFieldName.text!,"address":textFiledAddress.text!,"city":textFieldCity.text!])
    }
    
}
