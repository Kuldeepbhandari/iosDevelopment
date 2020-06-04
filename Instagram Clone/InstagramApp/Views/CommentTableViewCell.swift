//
//  CommentTableViewCell.swift
//  InstagramApp
//
//  Created by mac on 9/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var commentLabel: UILabel!
    
    var commentIndex: Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //commentLabel.delegate = self
        
        selectionStyle = .none
        
    }
    
}


