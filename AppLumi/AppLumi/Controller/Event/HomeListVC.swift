//
//  HomeListVC.swift
//  AppLumi
//
//  Created by appinventiv on 25/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class HomeListVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    
    var eventDetails = [Event]()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
       // print(eventDetails)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


//MARK:Uitableview delegate and datasource method
extension HomeListVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeListTableCell") as? HomeListTableCell else {return UITableViewCell()}
        
        print(eventDetails[indexPath.row].address)
      //  print(eventDetails[indexPath.row].ageRange.minAge)
        cell.ageLbl.text = "\(eventDetails[indexPath.row].ageRange.minAge) - \(eventDetails[indexPath.row].ageRange.minAge)"
        cell.attendPeopleLbl.text = "\(eventDetails[indexPath.row].atendees)"
        cell.freeDrinksLbl.text = "\(eventDetails[indexPath.row].freeDrinks)"
        cell.resturantName.text = eventDetails[indexPath.row].address
        cell.biilLabel.text = "\(eventDetails[indexPath.row].price)"
        cell.resturantLoaction.text = eventDetails[indexPath.row].loc.name
        cell.dateLbl.text = eventDetails[indexPath.row].eventDate.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "EventDetailsVC") as? EventDetailsVC else {return}
        storyboard.eventDetails = eventDetails[indexPath.row]
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
}
