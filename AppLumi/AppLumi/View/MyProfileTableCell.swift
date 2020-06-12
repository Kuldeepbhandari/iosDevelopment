//
//  MyProfileTableCell.swift
//  AppLumi
//
//  Created by appinventiv on 22/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class MyProfileTableCell: UITableViewCell {

    @IBOutlet var answerLbl: UILabel!
    @IBOutlet var questionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
