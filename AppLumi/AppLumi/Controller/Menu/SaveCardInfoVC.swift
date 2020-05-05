//
//  SaveCardInfoVC.swift
//  AppLumi
//
//  Created by appinventiv on 21/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SaveCardInfoVC: UIViewController {

    @IBOutlet var savedInfoBtn: UIButton!
    @IBOutlet var cvvTF: UITextField!
    @IBOutlet var expiaryYearTF: UITextField!
    @IBOutlet var expiryMonthText: UITextField!
    @IBOutlet var cardNoTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnWasPressed(_ sender: UIButton) {
    }
   
    @IBAction func savedCardInfoBtnWasPressed(_ sender: UIButton) {
    }
    
}
