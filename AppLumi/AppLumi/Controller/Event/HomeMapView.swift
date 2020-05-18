//
//  HomeMapView.swift
//  AppLumi
//
//  Created by appinventiv on 23/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON

class HomeMapView: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var collectionView: UICollectionView!
    
    //    MARK:Variables
    
    var eventsArr = [[String:Any]]()
    
    var eventDetails  = [Event]()
    var atendees : Int?
    var eventDescription : String?
    var event_date : String?
    var freeDrinks : Int?
    var name : String?
    var price : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        getEventDetails { (sucess) in
            if sucess{
                print("ok")
            }
        }
        
    }
    
    @IBAction func listBtnWasPressed(_ sender: Any) {
            
        guard let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "HomeListVC") as? HomeListVC else {return}
        print(eventDetails)
        storyboard.eventDetails = eventDetails
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
    func getEventDetails(completion : CompletionHandler){
        let param : [String:Any] = ["address": "sector 18 Noida",
                                    "date" : "04-26-2020"
        ]
        AF.request(GET_EVENT_DETAILS_URL, method: .get, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON {  (response) in
            guard let data = response.data else {return}
            DispatchQueue.main.async {
                self.parseDataUsingCodable(data: data)
                self.collectionView.reloadData()
            }
        }
    }
    
    
    func parseDataUsingCodable(data:Data){
        print(data)
        do{
            let eventDetail = try JSONDecoder().decode(EventDetail.self, from: data)
            print(eventDetail)
            for event in eventDetail.events{
                eventDetails.append(event)
            }
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}


//MARK:Collection View delegate and datasource method

extension HomeMapView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeMapCollectionCell", for: indexPath) as? HomeMapCollectionCell else {return UICollectionViewCell()}        
        if eventDetails.isEmpty{
            return cell
        }else{
            
            cell.restaurantNameLbl.text = eventDetails[indexPath.row].address
            cell.attendLbl.text = "\(String(describing: eventDetails[indexPath.row].atendees))"
            cell.freeDrinksLbl.text = "\(String(describing: eventDetails[indexPath.row].freeDrinks))"
            cell.ageLbl.text = "\(String(describing: eventDetails[indexPath.row].ageRange.minAge)) - \(String(describing: eventDetails[indexPath.row].ageRange.maxAge))"
            cell.priceLbl.text = "\(eventDetails[indexPath.row].price)"
            cell.resturantAddressLbl.text = eventDetails[indexPath.row].loc.name
        }
        return cell
        
    }
    
    
}
