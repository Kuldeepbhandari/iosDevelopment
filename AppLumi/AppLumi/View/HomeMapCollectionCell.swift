//
//  HomeMapCollectionCell.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 23/04/20.
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
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 11.2
        ticketCountAvaiableLbl.layer.cornerRadius = 11.2
        ticketCountAvaiableLbl.clipsToBounds = true
        
    }
    
    @IBAction func bookBtnWasTappeedAction(_ sender: UIButton) {
        
    }
}
