//
//  MesaageCell.swift
//  SmackChatApp
//
//  Created by mac on 02/04/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class MesaageCell: UITableViewCell {

    @IBOutlet weak var lblTimeStamp: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

    func configureCell(message:Message){
        lblMessage.text = message.message
        lblUsername.text = message.userName
        userImage.image = UIImage(named: message.userAvatar)
        userImage.backgroundColor = UserDataServices.instance.returnColor(component: message.userAvatarColor)
        
//        For upate time and date in label
//        by default apple provide this date format 2020-07-12T21:49:25:590z
        guard var isoDate = message.timeStamp else {return}
        let end = isoDate.index(isoDate.endIndex, offsetBy: -5) //this line remove 5 digit at the end
        isoDate =  String(isoDate.prefix(upTo: end))
        
        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: isoDate.appending("Z"))
        print(chatDate)
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "MMM d, h:mm a"
        
        if let finalDate = chatDate{
            let finalDate = newFormatter.string(from: finalDate)
            lblTimeStamp.text = finalDate
        }
        
    }

}
