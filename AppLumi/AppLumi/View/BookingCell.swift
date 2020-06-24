//
//  BookingCell.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 12/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class BookingCell: UITableViewCell {

    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var resutrantNameLbl: UILabel!
    @IBOutlet weak var evetntDateLbl: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var eventDetailsBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func openBookingDetailsBtnWasTapped(_ sender: Any) {
    }
}
