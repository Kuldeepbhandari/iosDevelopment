//
//  HomeMapCollectionCell.swift
//  AppLumi
//
//  Created by appinventiv on 23/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class HomeMapCollectionCell: UICollectionViewCell {
    
    @IBOutlet var freeDrinksLbl: UILabel!
    @IBOutlet var attendLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var resturantAddressLbl: UILabel!
    @IBOutlet var restaurantNameLbl: UILabel!
    @IBOutlet var dayNameLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var monthLbl: UILabel!
    @IBOutlet var ageLbl: UILabel!
    @IBOutlet var ticketCountAvaiableLbl: UILabel!
    @IBOutlet var pubImage: UIImageView!
    @IBOutlet var bookBtnWasPressed: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func bookBtnWasTappeedAction(_ sender: UIButton) {
        
    }
}
