//
//  FeetCell.swift
//  AppLumi
//
//  Created by appinventiv on 03/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class FeetCell: UITableViewCell {

    @IBOutlet var labelFeet: UILabel!
    
    @IBOutlet var feetView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            feetView.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
            feetView.layer.cornerRadius = 20
            feetView.clipsToBounds = true
            labelFeet.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        }else{
            feetView.backgroundColor = UIColor.clear
            labelFeet.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        }

        // Configure the view for the selected state
    }

}
