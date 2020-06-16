//
//  ChatVC.swift
//  SmackChatApp
//
//  Created by mac on 27/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    @IBOutlet weak var menuOptions: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var typinguserLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textMessage: UITextField!
    @IBOutlet weak var channelNameLbl: UILabel!
    var isTping = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()
        sendBtn.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
        menuOptions.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
        //        For if user close the app from background
        //        THis function is used if user is allready logged in then we can find the infromation
        if AuthService.instance.isLoggedIn{
            AuthService.instance.findUserByEmail { (sucess) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            }
            tableView.estimatedRowHeight = 80
            tableView.estimatedRowHeight = UITableView.automaticDimension
        }
        
        //        MARK:Addobserver if user is logged in
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        //        THis Notification obeserver the listen the selected channel
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectedChannel(_ :)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        
//        SocketServices.instance.getChatMessage { (sucees) in
//            if sucees{
//                self.tableView.reloadData()
//                //to scroll bootm of the tableview
//                if MessageService.instance.messages.count > 0{
//                    let endIndex = IndexPath(row: MessageService.instance.messages.count-1, section: 0)
//                    self.tableView.scrollToRow(at: endIndex, at: .bottom, animated: false)
//                }
//            }
//        }
//        MARK:THis is used to check for new mesaage is coming for which channel
        SocketServices.instance.getChatMessage { (newMessage) in
            if newMessage.channelId == MessageService.instance.selectedChannel?.id && AuthService.instance.isLoggedIn{
                MessageService.instance.messages.append(newMessage)
                self.tableView.reloadData()
                if MessageService.instance.messages.count > 0{
                    let endIndex = IndexPath(row: MessageService.instance.messages.count-1, section: 0)
                    self.tableView.scrollToRow(at: endIndex, at: .bottom, animated: false)
                }
            }
        }
        
        SocketServices.instance.getTypingUsers { (typingUsers) in
            guard let channelId = MessageService.instance.selectedChannel?.id else {return}
            var names = ""
            var noOfTypers = 0
            for  (typingUser , channel) in typingUsers{
                if typingUser != UserDataServices.instance.name && channel == channelId{
                    if names == "" {
                        names = typingUser
                        
                    }else{
                        names = "\(names), \(typingUser)"
                    }
                    noOfTypers += 1
                }
            }
            if noOfTypers > 0 && AuthService.instance.isLoggedIn == true{
                var verb = "is"
                if noOfTypers > 1{
                    verb = "are"
                }
                self.typinguserLabel.text = "\(names) \(verb) typing a message"
            }else{
                self.typinguserLabel.text = ""
            }
        }
    }
    
    @objc func selectedChannel(_ notif:Notification){
        updateWithChannel()
    }
    
    @objc func dismissView(){
        dismiss(animated: true, completion: nil)
    }
    //    MARK:To chnage the label name and get particular message
    func updateWithChannel(){
        let channel = MessageService.instance.selectedChannel?.channelTitle ?? ""
        self.channelNameLbl.text = "#\(channel)"
        getMessage()
    }
    
    //  MARK:  This function is used to clear message and channels if user is login and logout
    @objc func userDataDidChange(_ notif:Notification){
        if AuthService.instance.isLoggedIn{
            onLoginGetMessage()
            
        }else{
            channelNameLbl.text = "Please Log In"
            tableView.reloadData()
        }
    }
    
    //    MARK:This function is used to get all the message
    func onLoginGetMessage(){
        MessageService.instance.findAllChannel { (sucess) in
            if sucess{
                //if channel value is grater than one then we can excute this block
                if MessageService.instance.channels.count > 0{
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                }else{
                    self.channelNameLbl.text = "No channels yet!"
                }
            }
        }
    }
    
    @IBAction func textBoxEditng(_ sender: Any) {
        guard let channelId = MessageService.instance.selectedChannel?.id else {return}
        if textMessage.text == ""{
            isTping = false
            sendBtn.isHidden = true
            SocketServices.instance.socket.emit("stopType", UserDataServices.instance.name,channelId)
        }else{
            if isTping == false{
                sendBtn.isHidden = false
                SocketServices.instance.socket.emit("startType", UserDataServices.instance.name,channelId)
                
            }
            isTping = true
        }
    }
    //    MARK:This function is used to get message by individualy user
    
    func getMessage(){
        guard let channelId = MessageService.instance.selectedChannel?.id else {return}
        MessageService.instance.findAllMessage(channelId: channelId) { (sucess) in
            self.tableView.reloadData()
        }
    }
    
    
    @IBAction func tappedOnSendMessage(_ sender: UIButton) {
        if AuthService.instance.isLoggedIn{
            guard let chaanelId = MessageService.instance.selectedChannel?.id else {return}
            guard let message = textMessage.text else {return}
            SocketServices.instance.addMessage(messageBody: message, userId: UserDataServices.instance.id, channelId: chaanelId) { (sucess) in
                if sucess{
                    self.textMessage.text = ""
                    self.textMessage.resignFirstResponder()
                }
            }
        }
    }
}

extension ChatVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.messages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MesaageCell", for: indexPath) as? MesaageCell{
            let message = MessageService.instance.messages[indexPath.row]
            cell.configureCell(message: message)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    
    
}


