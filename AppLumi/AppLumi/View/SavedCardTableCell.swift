//
//  SavedCardTableCell.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 06/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class SavedCardTableCell: UITableViewCell {
    @IBOutlet weak var cardNoLabel: UILabel!
    
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cardNameLbl: UILabel!
    @IBOutlet weak var savedCardBtn: UIButton!
    
    var savedBtnTapped:(()->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func savedCardBtnWasTapped(_ sender: Any) {
        savedBtnTapped?()
    }
    
}
