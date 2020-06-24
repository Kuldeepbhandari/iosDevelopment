//
//  InviteVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 19/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class InviteVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tag:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        // Do any additional setup after loading the view.
    }
    
    func initialSetup(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "InvitesRecived", bundle: nil), forCellReuseIdentifier: "InvitesRecived")
        tableView.register(UINib(nibName: "InvitesSend", bundle: nil), forCellReuseIdentifier: "InvitesSend")
    }
    
    @IBAction func inviteSendBtnWasTapped(_ sender: UIButton) {
        tag = sender.tag
        tableView.reloadData()
    }
    
    @IBAction func backBtnWasTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func inviteRecivedBtnWasTapped(_ sender: UIButton) {
        tag = sender.tag
        tableView.reloadData()
    }
    
}

extension InviteVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tag == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InvitesSend", for: indexPath) as? InvitesSend else {return UITableViewCell()}
            
            return cell
            
        }else if tag == 2{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InvitesRecived", for: indexPath) as? InvitesRecived else {return UITableViewCell()}
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    
}
