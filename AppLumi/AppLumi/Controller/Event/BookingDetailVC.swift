//
//  BookingDetailVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 25/04/20.
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
   
    var eventDetails: Event!
    let taxPrice = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // initalSetup()
       // print(eventDetails)
        // Do any additional setup after loading the view.
        setupInitialViews()
    }
    
    func setupInitialViews(){
        let total = taxPrice + eventDetails.price
        taxesLbl.text = "$ \(taxPrice)"
        guard let eventDetail = eventDetails else {return}
        resturantNameLbl.text = eventDetail.loc.name
        resutrantLocationLbl.text = eventDetail.address
        totalLbl.text = "$ \(total)"
        ticketPriceLbl.text = "\(eventDetail.price)"
        
    }
    
    @IBAction func backBtnWasTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
