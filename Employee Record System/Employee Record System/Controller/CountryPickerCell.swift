//
//  CountryPickerCell.swift
//  Employee Record System
//
//  Created by appinventiv on 24/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class CountryPickerCell: UITableViewCell {

    @IBOutlet var checkmarkImage: UIImageView!
    @IBOutlet var countryImg: UIImageView!
    @IBOutlet var countryCodeLabel: UILabel!
    @IBOutlet var countryNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
