//
//  LoginVC.swift
//  TravelApp
//
//  Created by mac on 08/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var createNowTapped: UIButton!
    @IBOutlet weak var signInTapeed: CustomButton!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        initailSetup()
        // Do any additional setup after loading the view.
    }
    

    func initailSetup(){
        passwordText.setRightView(image: #imageLiteral(resourceName: "icons8-eye-16"))
        emailTextField.setRightView(image: #imageLiteral(resourceName: "icons8-name-50"))
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
