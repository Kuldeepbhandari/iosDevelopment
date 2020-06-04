//
//  CreatePostViewController.swift
//  InstagramApp
//
//  Created by mac on 20/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class CreatePostViewController: UIViewController {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var postCaptionTextView: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var postImage: UIImage!
    
    var activeTextView: UITextView?
    
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
    
    //    MARK-Progress Indicatior view
    
    lazy var progressIndicator : UIProgressView = {
        
        let _progressIndicator = UIProgressView()
        _progressIndicator.progressTintColor = UIColor.black
        _progressIndicator.trackTintColor = UIColor.lightGray
        _progressIndicator.progress = Float(0)
        _progressIndicator.translatesAutoresizingMaskIntoConstraints = false
        return _progressIndicator
        
    }()
    
    lazy var cancelButton : UIButton = {
        let _cancelButton = UIButton()
        
        _cancelButton.setTitle("Cancel", for: .normal)
        _cancelButton.setTitleColor(UIColor.black, for: .normal)
        _cancelButton.addTarget(self, action: #selector(cancelBtnTap), for: .touchUpInside)
        _cancelButton.translatesAutoresizingMaskIntoConstraints = false
        return _cancelButton
    }()
    
    var uploadTask:StorageUploadTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        postImageView.image = postImage
        
        postCaptionTextView.layer.borderWidth = CGFloat(0.5)
        
        postCaptionTextView.layer.borderColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0).cgColor
        
        postCaptionTextView.layer.cornerRadius = CGFloat(3.0)
        
        postCaptionTextView.delegate = self
        view.addSubview(progressIndicator)
        view.addSubview(cancelButton)
        //        MARK:Add contraints progrmatically
        
        let constraint : [NSLayoutConstraint] = [
            progressIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            progressIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            progressIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            cancelButton.topAnchor.constraint(equalTo: progressIndicator.bottomAnchor, constant: 5)
        ]
        
        NSLayoutConstraint.activate(constraint)
        progressIndicator.isHidden = true
        cancelButton.isHidden = true
        
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForKeyboardNotification()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        deregisterFromKeyboardNotification()
        
    }
    
    //    MARK:This function is used when we tap on cancel button
    @objc func cancelBtnTap(){
        progressIndicator.isHidden = true
        cancelButton.isHidden = true
        uploadTask?.cancel()
    }
    
    //    MARK:This function is used to upload image in firebase
    func uploadImageOnFirebase(data:Data){
        
        if let user = Auth.auth().currentUser{
            progressIndicator.isHidden = false
            cancelButton.isHidden = false
            progressIndicator.progress = Float(0)
            //MArk:This line is used to give random name of our image
            let imageId:String = UUID().uuidString.lowercased().replacingOccurrences(of: "-", with: "_")
            let imageName = "\(imageId).jpg"
            let pathToPic = "images/\(user.uid)/\(imageName)"
            let stroageRef = Storage.storage().reference(withPath: pathToPic)
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            uploadTask = stroageRef.putData(data, metadata: metaData, completion: { [weak self](metadata, error) in
                guard let strongself = self else {return}
                DispatchQueue.main.async {
                    strongself.progressIndicator.isHidden = true
                    strongself.cancelButton.isHidden = true
                }
                if let error = error{
                    print(error.localizedDescription)
                    let alert = Helper.errorAlert(title: "Upload Image Error", message: "There is an error uploading to image")
                    DispatchQueue.main.async {
                        strongself.present(alert, animated: true, completion: nil)
                    }
                }
                else{
                    //MArk:to download image from database
                    stroageRef.downloadURL { (url, error) in
                        if let url = url , error == nil{
                            UserModel.collection.child(user.uid).updateChildValues(["profile_image":url.absoluteString])
                            
                        }else{
                            let alert = Helper.errorAlert(title: "Upload Image Error", message: "There is an error uploading to image")
                            DispatchQueue.main.async {
                                strongself.present(alert, animated: true, completion: nil)
                            }
                        }
                    }

                }
            })
            
            uploadTask!.observe(.progress) { [weak self] (snapshot) in
                guard let strongself = self else {return}
                let percantComplete = 100.0 * Double(snapshot.progress!.completedUnitCount) / Double(snapshot.progress!.totalUnitCount)
                DispatchQueue.main.async {
                    strongself.progressIndicator.setProgress(Float(percantComplete), animated: true)
                }
            }
        }
    }
    
    func registerForKeyboardNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIWindow.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasHidden(notification:)), name: UIWindow.keyboardWillHideNotification, object: nil)
        
    }
    
    func deregisterFromKeyboardNotification() {
        
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
        
        view.addSubview(touchView)
        
        let info: NSDictionary = notification.userInfo! as NSDictionary
        
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        
        let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: (keyboardSize!.height + 10.0), right: 0.0)
        
        self.scrollView.contentInset = contentInsets
        
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect: CGRect = UIScreen.main.bounds
        
        aRect.size.height -= keyboardSize!.height
        
        if activeTextView != nil {
            
            if (aRect.contains(activeTextView!.frame.origin)) {
                
                self.scrollView.scrollRectToVisible(activeTextView!.frame, animated: true)
                
            }
            
        }
        
    }
    
    @objc func keyboardWasHidden(notification: NSNotification) {
        
        touchView.removeFromSuperview()
        
        let contentInsets: UIEdgeInsets = UIEdgeInsets.zero
        
        self.scrollView.contentInset = contentInsets
        
        self.scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
        
    }
    
    
    @IBAction func postButtonDidTouch(_ sender: Any) {
    }
    
    
}

extension CreatePostViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        activeTextView = textView
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        activeTextView = nil
        
    }
    
}