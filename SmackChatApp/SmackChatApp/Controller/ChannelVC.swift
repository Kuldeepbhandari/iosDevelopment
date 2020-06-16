//
//  ChannelVC.swift
//  SmackChatApp
//
//  Created by mac on 27/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    @IBOutlet weak var loginOutlets: UIButton!
    
    @IBOutlet weak var userImage: CircleImage!
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func prepareForUnwindSegue(segue:UIStoryboardSegue){}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width-60
        //        MARK:To send the requaet the user is looged
        NotificationCenter.default.addObserver(self, selector: #selector(saveUserLoginData(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        tableView.delegate = self
        tableView.dataSource = self
        SocketServices.instance.getChannel { (sucess) in
            if sucess{
//                receving new channel then we have to relaod the chaneel
                self.tableView.reloadData()
            }
        }
        
//        TO create a observer tp load the channel
        NotificationCenter.default.addObserver(self, selector: #selector(channelLoaded(_ :)), name: NOTIF_CHANNEL_LOADED, object: nil)
        
//        MARK:For which channael message is coming
        SocketServices.instance.getChatMessage { (newMessage) in
            if newMessage.channelId != MessageService.instance.selectedChannel?.id && AuthService.instance.isLoggedIn{
                MessageService.instance.unreadChannel.append(newMessage.channelId)
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpUserInfo()
    }
    @objc func saveUserLoginData(_ notification:Notification){
        setUpUserInfo()
    }
    
    @objc func channelLoaded(_ notification:Notification){
        tableView.reloadData()
    }
    
    //    MARK:To save the data if we minimize the application from background
    func setUpUserInfo(){
        if AuthService.instance.isLoggedIn{
            userImage.image = UIImage(named: UserDataServices.instance.avatarName)
            loginOutlets.setTitle(UserDataServices.instance.name, for: .normal)
            userImage.backgroundColor = UserDataServices.instance.returnColor(component: UserDataServices.instance.avatarColor)
        }else{
            userImage.image = UIImage(named: "menuProfileIcon")
            loginOutlets.setTitle("Login", for: .normal)
            userImage.backgroundColor = UIColor.clear
//            for update the channel 
            tableView.reloadData()
        }
    }
    
    //MARK:This function is used for add Chaanel only if user are logged in anotherwise we can't add Channel
    @IBAction func tappedOnAddChannel(_ sender: UIButton) {
        if AuthService.instance.isLoggedIn{
        let addChannel = AddChannelVC()
        addChannel.modalPresentationStyle = .custom
        self.present(addChannel, animated: true, completion: nil)
    }
    }
    
    @IBAction func tappedOnLogin(_ sender: UIButton) {
        if AuthService.instance.isLoggedIn{
            let profileVc = ProfileVC()
            profileVc.modalPresentationStyle = .custom
            present(profileVc, animated: true, completion: nil)
        }else{
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
}


//MARK:Tableview datasource and delegate

extension ChannelVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as? ChannelCell{
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
//    MARK:this function is used to select the channel
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chaneel = MessageService.instance.channels[indexPath.row]
        MessageService.instance.selectedChannel = chaneel
        NotificationCenter.default.post(name: NOTIF_CHANNEL_SELECTED, object: nil)
//        This lines is used to slide the view if selected the channel
        if MessageService.instance.unreadChannel.count > 0{
            MessageService.instance.unreadChannel = MessageService.instance.unreadChannel.filter({$0 != chaneel.id})
            
        }
//        For select and deselct the row
        let index = IndexPath(row: indexPath.row, section: 0)
        tableView.reloadRows(at: [index], with: .none)
        tableView.selectRow(at: index, animated: false, scrollPosition: .none)
        self.revealViewController()?.revealToggle(animated: true)
    }
    
}
