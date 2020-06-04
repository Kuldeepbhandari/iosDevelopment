//
//  FeedTableViewCell.swift
//  InstagramApp
//
//  Created by mac on 19/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userNameTitleButton: UIButton!
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var likesCountLabel: UILabel!
    
    @IBOutlet weak var postCommentLabel: UILabel!
    
    @IBOutlet weak var commentCountButton: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var post: Post?
    
    weak var feedDelegate: FeedDataDelegate?
    
    weak var profileDelegate: ProfileDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        
        profileImage.layer.masksToBounds = true
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        
    }
    
    @IBAction func viewCommentsButtonDidTouch(_ sender: Any) {
        
        guard let post = post else { return }
        
        feedDelegate?.commentsDidTouch(post: post)
        
    }
    
    @IBAction func userNameButtonDidTouch(_ sender: Any) {
        
        profileDelegate?.userNameDidTouch()
        
    }
    
    @IBAction func likeButtonDidTouch(_ sender: Any) {
        
        
        
    }
    
    @IBAction func commentButtonDidTouch(_ sender: Any) {
        
        guard let post = post else { return }
        
        feedDelegate?.commentsDidTouch(post: post)
        
    }
    
}
