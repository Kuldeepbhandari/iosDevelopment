//
//  ChatVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 27/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

enum ChooseUser:String,CaseIterable{
    case Reciver
    case Sender
}

class ChatVC: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var otherOptionBtn: UIButton!
    @IBOutlet weak var otherOptionView: UIView!
    @IBOutlet weak var senderBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var selectSender:ChooseUser? = nil
    
    var message : [Message]?
    var flag = false
    
    var messageArr = [String]()
    let senderMsg = ["Reciver","Sender"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "SenderTableCell", bundle: nil), forCellReuseIdentifier: "SenderTableCell")
        tableView.register(UINib(nibName: "ReciverTableCell", bundle: nil), forCellReuseIdentifier: "ReciverTableCell")
        tableView.delegate = self
        tableView.dataSource = self
        messageTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        messageTextField.delegate = self
    }
    
    @IBAction func backBtnWasTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func sendBtnTapped(_ sender: UIButton) {
        selectSenderUser(selectUser: ChooseUser.Sender)
    }
    
    
    func selectUser(cell:UITableViewCell,index:IndexPath){
        
        
    }
    
    @IBAction func sideBtnWasTapped(_ sender: UIButton) {
        if flag == false{
            otherOptionView.isHidden = false
            flag = true

        }else if flag == true{
            otherOptionView.isHidden = true
            flag = false
        }
    }
    
    func selectSenderUser(selectUser:ChooseUser){
        switch selectUser{
        case .Reciver:
            selectSender = ChooseUser(rawValue: selectUser.rawValue)
            guard let message = messageTextField.text , messageTextField.text != "" else {return}
            messageArr.append(message)
            tableView.reloadData()
        case .Sender:
            selectSender = ChooseUser(rawValue: selectUser.rawValue)
            guard let message = messageTextField.text , messageTextField.text != "" else {return}
            messageArr.append(message)
            tableView.reloadData()
        }
    }
    
    @IBAction func attachBtnWasTapped(_ sender: Any) {
        
        
    }
    
}

//MARK:Uitableview datasource and delegate method

extension ChatVC:UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row % 2 == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReciverTableCell", for: indexPath) as? ReciverTableCell else {return UITableViewCell()}
            cell.reviverMessageLbl.text = messageArr[indexPath.row]
            return cell
        }else {
             guard let cell = tableView.dequeueReusableCell(withIdentifier: "SenderTableCell", for: indexPath) as? SenderTableCell else {return UITableViewCell()}
             cell.textMsg.text = messageArr[indexPath.row]
                        return cell
    
        }
    }
}

//MARK:Uitextfield delegate method

extension ChatVC:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
         textField.text = ""
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}
