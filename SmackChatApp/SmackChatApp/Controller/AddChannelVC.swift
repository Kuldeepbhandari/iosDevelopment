//
//  AddChannelVC.swift
//  SmackChatApp
//
//  Created by mac on 31/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var bgVIew: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
//MARK:This function is used for add Chaanel only if user are logged in anotherwise we can't add Channel
    @IBAction func createChannel(_ sender: RoundedButton) {
        guard let channelName = nameLbl.text , nameLbl.text != "" else {return}
        guard let channelDesc = descriptionText.text , descriptionText.text != "" else {return}
        SocketServices.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (sucess) in
            if sucess{
                self.dismiss(animated: true, completion: nil)
                // using this we add channel but after this step we also create a functon to get the response from the server because at this the data is save only server.
            }
        }
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
   
    func setUpView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handelTap))
        view.addGestureRecognizer(tap)
        descriptionText.attributedPlaceholder = NSAttributedString(string: "Enter Username", attributes: [NSAttributedString.Key.foregroundColor:smackPurplePlaceHolder])
         nameLbl.attributedPlaceholder = NSAttributedString(string: "Enter Email", attributes: [NSAttributedString.Key.foregroundColor:smackPurplePlaceHolder])
         
    }
    
    @objc func handelTap(){
        dismiss(animated: true, completion: nil)
    }

}
