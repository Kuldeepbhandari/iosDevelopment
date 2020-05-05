//
//  WelcomeVC.swift
//  AppLumi
//
//  Created by appinventiv on 21/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet var LbltermsAndConditions: UILabel!
    
    //    MARK:Controller Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        inititalSetup()
    }
    //    MARK:This function is used to call the all initail setup of View Controller
    
    private func inititalSetup(){
        let attributedString = NSMutableAttributedString(string: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum\rLorem Ipsum Lorem Terms & Conditions")
        attributedString.addAttributes([
            NSAttributedString.Key.foregroundColor: UIColor(red: 226.0 / 255.0, green: 67.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0)
        ], range: NSRange(location: 66, length: 18))
        let attribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue | NSUnderlineStyle.single.rawValue]
        attributedString.addAttributes(attribute, range: NSRange(location: 66, length: 18))
        LbltermsAndConditions.attributedText = attributedString
    }
    
    //    MARK:This function is used to login With Facebook
    @IBAction func tappedOnFaceook(_ sender: UIButton) {
        
    }
    //    MARK:This function is used to login With instagram
    @IBAction func tappedOnInstagram(_ sender: UIButton) {
        
    }
    //    MARK:This function is used to login With phone number
    @IBAction func tappedOnPhoneNumber(_ sender: UIButton) {
        let phoneNoVC = self.storyboard?.instantiateViewController(identifier: "SignUpPhoneVC") as! SignUpPhoneVC
        self.navigationController?.pushViewController(phoneNoVC, animated: true)
    }
}
