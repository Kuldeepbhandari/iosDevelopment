//
//  ProfileVC.swift
//  SmackChatApp
//
//  Created by mac on 30/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }


    @IBAction func pressedLogout(_ sender: UIButton) {
        UserDataServices.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedCloseBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUpView(){
        profileImage.image = UIImage(named: UserDataServices.instance.avatarName)
        userName.text = UserDataServices.instance.name
        lblEmail.text = UserDataServices.instance.email
        profileImage.backgroundColor = UserDataServices.instance.returnColor(component: UserDataServices.instance.avatarColor)
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(closeTap))
        view.addGestureRecognizer(closeTouch)
        
    }
    
    @objc func closeTap(){
        dismiss(animated: true, completion: nil)
    }
}
