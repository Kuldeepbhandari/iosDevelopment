//
//  MainVCTableCell.swift
//  RechabilityDemo
//
//  Created by mac on 30/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class MainVCTableCell: UITableViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
