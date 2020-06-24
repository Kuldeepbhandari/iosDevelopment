//
//  HomeListTableCell.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 25/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class HomeListTableCell: UITableViewCell {

    @IBOutlet var ageLbl: UILabel!
    @IBOutlet var ticketAviableLbl: UILabel!
    @IBOutlet var biilLabel: UILabel!
    @IBOutlet var freeDrinksLbl: UILabel!
    @IBOutlet var attendPeopleLbl: UILabel!
    @IBOutlet var bookBtn: UIButton!
    @IBOutlet var resturantLoaction: UILabel!
    @IBOutlet var resturantName: UILabel!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var resturantImage: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 11.2
        ticketAviableLbl.layer.cornerRadius = 11.2
        ticketAviableLbl.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func bookBtnWasPressed(_ sender: UIButton) {
        
    }
}
