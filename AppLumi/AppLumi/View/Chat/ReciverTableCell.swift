//
//  ReciverTableCell.swift
//  AppLumi
//
//  Created by mac on 13/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class ReciverTableCell: UITableViewCell {

    @IBOutlet weak var reciverTimeStampLbl: UILabel!
    @IBOutlet weak var reviverMessageLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
