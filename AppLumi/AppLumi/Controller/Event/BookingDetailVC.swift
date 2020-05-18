//
//  BookingDetailVC.swift
//  AppLumi
//
//  Created by appinventiv on 25/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit


class BookingDetailVC: UIViewController {
    @IBOutlet var taxesLbl: UILabel!
    
    @IBOutlet var bookingIdLbl: UILabel!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var ticketPriceLbl: UILabel!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var dateAndTimingLbl: UILabel!
    @IBOutlet var resutrantLocationLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var resturantNameLbl: UILabel!
    @IBOutlet var resutrantImage: UIImageView!
    
//    MARK:Variables
    var resturantAddress:String!
    var resturantName:String!
    var eventDate:String!
    var price:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetup()
        // Do any additional setup after loading the view.
    }
    
    func initalSetup(){
        totalLbl.text = price
        locationLbl.text = resturantAddress
        resturantNameLbl.text = resturantAddress
        dateLbl.text = eventDate
        dateAndTimingLbl.text = eventDate
    }

}
