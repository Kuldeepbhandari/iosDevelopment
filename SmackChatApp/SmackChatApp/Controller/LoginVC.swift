//
//  LoginVC.swift
//  SmackChatApp
//
//  Created by mac on 27/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var spineer: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedOnLogin(_ sender: UIButton) {
        spineer.isHidden = false
        spineer.startAnimating()
        guard let userName = usernameText.text , usernameText.text != "" else {return}
        guard let password = passwordText.text , passwordText.text != "" else {return}
        AuthService.instance.loginUser(email: userName, password: password) { (sucess) in
            if sucess{
                AuthService.instance.findUserByEmail { (sucess) in
                    if sucess{
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spineer.isHidden = true
                        self.spineer.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }

    }
    
    @IBAction func createAccountBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    func setUpViews(){
        spineer.isHidden = true
        passwordText.attributedPlaceholder = NSAttributedString(string: "Enter Password", attributes: [NSAttributedString.Key.foregroundColor:smackPurplePlaceHolder])
                usernameText.attributedPlaceholder = NSAttributedString(string: "Enter Username", attributes: [NSAttributedString.Key.foregroundColor:smackPurplePlaceHolder])
    }
}
