//
//  InchCell.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 03/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class InchCell: UITableViewCell {

    @IBOutlet var inchView: UIView!
    @IBOutlet var labelInch: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
           inchView.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
            inchView.layer.cornerRadius = 20
            labelInch.textColor = UIColor.black
            labelInch.font = UIFont(name: "GalanoClassicAltW00-SemiBd", size: 22.5)
            labelInch.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
            inchView.clipsToBounds = true
        }else{
            inchView.backgroundColor = UIColor.clear
            labelInch.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        }
    }

}
