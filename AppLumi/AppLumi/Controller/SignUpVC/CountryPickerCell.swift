//
//  CountryPickerCell.swift
//  AppLumi
//
//  Created by appinventiv on 21/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class CountryPickerCell: UITableViewCell {

    @IBOutlet var countryImg: UIImageView!
    @IBOutlet var countryCodeLabel: UILabel!
    @IBOutlet var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countryImg.layer.cornerRadius = countryImg.frame.width/2
        countryImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
