//
//  Protocols.swift
//  InstagramApp
//
//  Created by mac on 18/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import Foundation

protocol FeedDataDelegate: class {
    
    func commentsDidTouch(post: Post)
    
}

protocol ProfileDelegate: class {
    
    func userNameDidTouch()
    
}

protocol ActivityDelegate: class {
    
    func scrollTo(index: Int)
    
    func activityDidTouch()
    
}


protocol ProfileHeaderDelegate:class {
    
    func profileImageDidTouch()
}
