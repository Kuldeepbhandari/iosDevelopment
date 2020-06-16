//
//  CreateAccountVC.swift
//  SmackChatApp
//
//  Created by mac on 27/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//


import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textUsername: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    @IBOutlet weak var spineer: UIActivityIndicatorView!
    //    MARK:Variables
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    var bgColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    
        }
    
    override func viewDidAppear(_ animated: Bool) {
//        To update the image
        if UserDataServices.instance.avatarName != ""{
            userImg.image = UIImage(named: UserDataServices.instance.avatarName)
            avatarName = UserDataServices.instance.avatarName
//            MARK:Use for provide default color
            if avatarName.contains("light") && bgColor == nil{
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    

    @IBAction func tapOnClose(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
    @IBAction func tapOnCreateAccount(_ sender: UIButton) {
        spineer.isHidden = false
        spineer.startAnimating()
        guard let email = textEmail.text , textEmail.text != "" else {return}
        guard let pass = textPassword.text , textPassword.text != nil else {return}
        guard let name = textUsername.text , textUsername.text != nil else {return}
        AuthService.instance.registerUser(email: email, password: pass) { (sucess) in
            if sucess{
                 AuthService.instance.loginUser(email: email, password: pass) { (sucess) in
                    if sucess{
                        print("Logged in user ", AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor) { (sucess) in
                            self.spineer.isHidden = true
                            self.spineer.stopAnimating()
                            print(UserDataServices.instance.name, UserDataServices.instance.avatarName)
                            self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
//                            TO post notication
                            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        }
                    }
                }
            }else{
                print("User not register")
            }
        }
    }
    
    @IBAction func GenrateBgColor(_ sender: UIButton) {
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.3){
            self.userImg.backgroundColor = self.bgColor
        }
    }
    @IBAction func pickAvatarTapped(_ sender: Any) {
        performSegue(withIdentifier: To_PICKER_AVATAR, sender: nil)
    }
    
    
//    MARK:To change textfield placeholder
    
    func setUpView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handelTap))
        view.addGestureRecognizer(tap)
        spineer.isHidden = true
        textUsername.attributedPlaceholder = NSAttributedString(string: "Enter Username", attributes: [NSAttributedString.Key.foregroundColor:smackPurplePlaceHolder])
         textEmail.attributedPlaceholder = NSAttributedString(string: "Enter Email", attributes: [NSAttributedString.Key.foregroundColor:smackPurplePlaceHolder])
         textPassword.attributedPlaceholder = NSAttributedString(string: "Enter Password", attributes: [NSAttributedString.Key.foregroundColor:smackPurplePlaceHolder])
    }
    

    @objc func handelTap(){
        self.view.endEditing(true)
    }
    
}
