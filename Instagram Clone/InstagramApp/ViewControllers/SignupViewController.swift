//
//  SignupViewController.swift
//  InstagramApp
//
//  Created by mac on 20/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

import FirebaseDatabase
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var animatedGradientView: AnimatedGradient!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var activeField: UITextField?
    
    var keyboardNotification: NSNotification?
    
    lazy var touchView: UIView = {
        
        let _touchView = UIView()
        
        _touchView.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha: 0.0)
        
        let touchViewTapped = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        _touchView.addGestureRecognizer(touchViewTapped)
        
        _touchView.isUserInteractionEnabled = true
        
        _touchView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        return _touchView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        signUpButton.layer.borderWidth = CGFloat(0.5)
        
        signUpButton.layer.borderColor = UIColor.white.cgColor
        
        signUpButton.layer.cornerRadius = CGFloat(3.0)
        
        emailTextField.delegate = self
        
        usernameTextField.delegate = self
        
        passwordTextField.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animatedGradientView.startAnimation()
        
        registerForKeyboardNotifications()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        animatedGradientView.stopAnimation()
        
        deregisterFromKeyboardNotifications()
        
    }
    
    func registerForKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIWindow.keyboardWillHideNotification, object: nil)
        
    }
    
    func deregisterFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
        
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
        
        view.addSubview(touchView)
        
        self.keyboardNotification = notification
        
        let info: NSDictionary = notification.userInfo! as NSDictionary
        
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: (keyboardSize!.height + 10.0), right: 0.0)
        
        self.scrollView.contentInset = contentInsets
        
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = UIScreen.main.bounds
        
        aRect.size.height -= keyboardSize!.height
        
        if activeField != nil {
            
            if (!aRect.contains(activeField!.frame.origin)) {
                
                self.scrollView.scrollRectToVisible(activeField!.frame, animated: true)
                
            }
            
        }
        
    }
    
    @objc func keyboardWillBeHidden(notification: NSNotification) {
        
        touchView.removeFromSuperview()
        
        let contentInsets : UIEdgeInsets = UIEdgeInsets.zero
        
        self.scrollView.contentInset = contentInsets
        
        self.scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
        
    }
    
    @IBAction func signUpButtonDidTouch(_ sender: Any) {
        
        guard let email = emailTextField.text else {return}
        
        guard let password = passwordTextField.text else {return}
        
        guard let userName = usernameTextField.text else {return}
        
        let spinner = UIViewController.displayLoading(withView: self.view)
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self](user, error) in
            guard let strongSelf = self else {return}
            if error == nil{
                
                guard let userId = user?.user.uid else {return}
                
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    DispatchQueue.main.async {
                        UIViewController.removeLoading(spinner: spinner)
                    }
                    if error == nil{
                        
                        let userRef = Database.database().reference().child("users").child(userId)
                        userRef.updateChildValues(["username":userName,"bio":"Welcome to my profile"])
                        DispatchQueue.main.async {
                            Helper.login()
                        }
                        
                    }else if let error = error{
                        print(error.localizedDescription)
                        var errorTitle : String = "password is wrong"
                        var errorMessage:String = "There was a problem in logining in"
                        
                        if let errorCode = AuthErrorCode.init(rawValue: error._code){
                            switch errorCode {
                            case .wrongPassword:
                                errorTitle = "Password wrong"
                                errorMessage = "The password you enterd is wrong"
                                
                            case .invalidEmail:
                                errorTitle = "Incorrect email"
                                errorMessage = "The email is incorrect"
                            default:
                                break
                            }
                        }
                        
                        let alert = Helper.errorAlert(title: errorTitle, message: errorMessage)
                        DispatchQueue.main.async {
                            strongSelf.present(alert, animated: true, completion: nil)
                        }
                    }
                }
            }else if let error = error{
                print(error.localizedDescription)
                var errorTitle : String = "SignUp Error"
                var errorMessage:String = "There was a problem in Signup in"
                
                if let errorCode = AuthErrorCode.init(rawValue: error._code){
                    switch errorCode {
                    case .emailAlreadyInUse:
                        errorTitle = "Email Allready in use"
                        errorMessage = "Please provide a different email"
                        
                    case .invalidEmail:
                        errorTitle = "Incorrect email"
                        errorMessage = "The email is incorrect"
                        
                    case .weakPassword:
                        errorTitle = "Weak Password"
                        errorMessage = "Please enter a strong passwordx"
                    default:
                        break
                    }
                }
                
                let alert = Helper.errorAlert(title: errorTitle, message: errorMessage)
                DispatchQueue.main.async {
                    strongSelf.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        
    }
    
    
    @IBAction func alreadyHaveAnAccountButtonDidTouch(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}

extension SignupViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        activeField = nil
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        activeField = textField
        
    }
    
}
