//
//  ChangeInchCell.swift
//  AppLumi
//
//  Created by mac on 01/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class ChangeInchCell: UITableViewCell {

    @IBOutlet weak var inchLabel: UILabel!
    @IBOutlet weak var inchView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
                  inchView.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
                   inchView.layer.cornerRadius = 20
                   inchView.clipsToBounds = true
                   inchLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
               }else{
                   inchView.backgroundColor = UIColor.clear
                   inchLabel.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
               }
    }

}
