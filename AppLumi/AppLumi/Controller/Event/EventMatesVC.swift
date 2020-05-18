//
//  EventMatesVC.swift
//  AppLumi
//
//  Created by mac on 15/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class EventMatesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "EventMatesCell", bundle: nil), forCellReuseIdentifier: "EventMatesCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    

}


extension EventMatesVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventMatesCell") as? EventMatesCell else {return UITableViewCell()}
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(434)
    }
    
    
}
