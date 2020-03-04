//
//  ViewController.swift
//  ValidateTextField
//
//  Created by mac on 04/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var repeatPasseord: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapeedOnSignUpBtn(_ sender: UIButton) {
        let lastName = textLastName.text
        let firstName = textFirstName.text
        let email = textEmail.text
        let password = textPassword.text
        let repeatPassword = repeatPasseord.text
        
        if (lastName!.isEmpty || firstName!.isEmpty || email!.isEmpty || password!.isEmpty || repeatPassword!.isEmpty){
            let alert = UIAlertController(title: "Please Fill all Fields", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
       else if (password != repeatPassword!){
            let alert = UIAlertController(title: "Password Didn't match", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
    }
    
    @IBAction func textValid(_ sender: UITextField) {
        if sender.tag == 1{
            let email = sender.text!
            if email.isValidEmail{
                print("valid email")
            }else{
                let alert = UIAlertController(title: "Email is not valid", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }else if sender.tag == 2{
            let password = sender.text!
            print(password)
        }else if sender.tag == 3{
            let repeatPassword = sender.text!
            print(repeatPassword)
        }else if sender.tag == 4{
            let fistName = sender.text!
            print(fistName)
        }else if sender.tag == 5{
            let lastName = sender.text!
            print(lastName)
        }
    }
    
    
}

extension String {
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    
}

