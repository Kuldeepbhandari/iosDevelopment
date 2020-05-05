//
//  EventDetailsVC.swift
//  AppLumi
//
//  Created by appinventiv on 28/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class EventDetailsVC: UIViewController {

    var eventDetails: Event!

    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var drinkAvaiableLbl: UILabel!
    @IBOutlet weak var resutrantAddressLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var resutrantNameLbl: UILabel!
    @IBOutlet weak var ticketAvaialbleBl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitalView()
    }
    
    func setupInitalView(){
        ageLbl.text = "\(eventDetails.ageRange.minAge) - \(eventDetails.ageRange.maxAge)"
        drinkAvaiableLbl.text = "\(eventDetails.freeDrinks)"
        resutrantAddressLbl.text = eventDetails.address
        descriptionLbl.text = eventDetails.eventDescription
        priceLbl.text = "\(eventDetails.price)"
        resutrantNameLbl.text = eventDetails.loc.name
    }
    
}
