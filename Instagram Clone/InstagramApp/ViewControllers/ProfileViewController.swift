//
//  ProfileViewController.swift
//  InstagramApp
//
//  Created by mac on 20/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

import FirebaseDatabase
import FirebaseAuth

import FirebaseStorage

import SDWebImage

enum ProfileType {
    
    case personal, otherUser
    
}

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = [Post]()
    
    var profileType: ProfileType = .personal
    
    var user:UserModel?
    
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
    
    var uiImagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        
        tableView.tableFooterView = UIView()
        
        tableView.separatorStyle = .none
        loadData()
        
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
        uiImagePicker.delegate = self
    }
    
    //    MARK:This function is used to read data from database
    
    func loadData(){
        guard let userId = Auth.auth().currentUser?.uid else {return}
        
        let spinner = UIViewController.displayLoading(withView: self.view)
        let userRef = UserModel.collection.child(userId)
        
        userRef.observe(.value) { [weak self](snapshot) in
            // print(snapshot)
            guard let strongself = self else {return}
            UIViewController.removeLoading(spinner: spinner)
            guard let user = UserModel(snapshot) else {return}
            strongself.user = user
            DispatchQueue.main.async {
                strongself.tableView.reloadData()
                
            }
        }
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
    //    MARK:This function is used when we tap on cancel button
    @objc func cancelBtnTap(){
        progressIndicator.isHidden = true
        cancelButton.isHidden = true
        uploadTask?.cancel()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
            
        }
        else if section == 1 {
            
            return 1
            
        }
        else {
            
            return posts.count
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let profileHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderTableViewCell") as! ProfileHeaderTableViewCell
            
            profileHeaderTableViewCell.profileType = profileType
            profileHeaderTableViewCell.nameLabel.text = ""
            profileHeaderTableViewCell.delegate = self
            if let user = user{
                
                profileHeaderTableViewCell.nameLabel.text = user.username
                if let profileImage = user.userImage{
                    profileHeaderTableViewCell.profileImageView.sd_cancelCurrentImageLoad()
                    profileHeaderTableViewCell.profileImageView.sd_setImage(with: profileImage, completed: nil)
                }
            }
            
            switch profileType {
                
            case .otherUser:
                
                profileHeaderTableViewCell.profileButton.setTitle("Follow", for: .normal)
                
            case .personal:
                
                profileHeaderTableViewCell.profileButton.setTitle("Logout", for: .normal)
                
                profileHeaderTableViewCell.profileButton.setTitleColor(UIColor.red, for: .normal)
                
            }
            
            return profileHeaderTableViewCell
            
        }
        else if indexPath.section == 1 {
            
            let profileViewStyleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileViewStyleTableViewCell") as! ProfileViewStyleTableViewCell
            
            return profileViewStyleTableViewCell
            
        }
        else if indexPath.section == 2 {
            
            let feedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as! FeedTableViewCell
            
            return feedTableViewCell
            
        }
        else {
            
            return UITableViewCell()
            
        }
        
    }
    
}

extension ProfileViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
 @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage =  info[.editedImage] as? UIImage{
            if let resizedImage = pickedImage.resized(toWidth: 1080){
                if let imageData = resizedImage.jpegData(compressionQuality: 0.75){
                    //upload to firebase
                    uploadImageOnFirebase(data: imageData)
                    
                }
            }
        }
    dismiss(animated: true, completion: nil)
    }
}


extension ProfileViewController:ProfileHeaderDelegate{
    func profileImageDidTouch() {
        let alertController = UIAlertController(title: "Change Profile", message: "Change your profile photo", preferredStyle: .actionSheet)
        let librayOption = UIAlertAction(title: "Import from library", style: .default) { (action) in
            self.uiImagePicker.allowsEditing = true
            self.uiImagePicker.sourceType = .photoLibrary
            self.present(self.uiImagePicker, animated: true, completion: nil)
        }
        
        let takePhotoOption = UIAlertAction(title: "Take Photo", style: .default) { (action) in
            self.uiImagePicker.allowsEditing = true
            self.uiImagePicker.sourceType = .camera
            self.present(self.uiImagePicker, animated: true, completion: nil)
        }
        
        let canelOption = UIAlertAction(title: "Cancel", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(librayOption)
        alertController.addAction(takePhotoOption)
        alertController.addAction(canelOption)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
