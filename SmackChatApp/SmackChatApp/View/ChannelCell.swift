//
//  ChannelCell.swift
//  SmackChatApp
//
//  Created by mac on 31/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var channelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.3).cgColor
        }else{
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }

    func configureCell(channel:Channel){
        let title = channel.channelTitle
        channelLabel.text = "#\(title ?? "")"
        
//        For undread channel
        channelLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        for id in MessageService.instance.unreadChannel{
            if id == channel.id{
                channelLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22)

            }
        }
    }
}
