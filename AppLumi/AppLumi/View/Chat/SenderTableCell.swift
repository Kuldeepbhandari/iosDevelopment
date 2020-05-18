//
//  SenderTableCell.swift
//  AppLumi
//
//  Created by mac on 13/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SenderTableCell: UITableViewCell {

    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var textMsg: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
