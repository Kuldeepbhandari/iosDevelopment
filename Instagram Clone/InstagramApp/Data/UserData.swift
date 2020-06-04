//
//  UserData.swift
//  InstagramApp
//
//

import Foundation

import UIKit

import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

struct User {
    
    var name: String
    
    var profileImage: UIImage
    
}

class UsersModel {
    
    var users: [User] = [User]()
    
    init() {
        
        let user1 = User(name: "John Carmack", profileImage: UIImage(named: "user1")!)
        
        users.append(user1)
        
        let user2 = User(name: "Bjarne Stroustrup", profileImage: UIImage(named: "user2")!)
        
        users.append(user2)
        
    }
    
    
}


class UserModel{
    
    static var collection:DatabaseReference{
        get{
            return Database.database().reference().child("users")
        }
    }
    
    var username : String = ""
    var bio : String = ""
    
    var userImage : URL?
    //    MARK:we create a failibaure initilizer because data should not be in correct format
    
    init?(_ snapshot:DataSnapshot) {
        
        guard let value = snapshot.value as? [String:Any] else {return nil}
        
        self.username = value["username"] as? String ?? ""
        self.bio = value["bio"] as? String ?? ""
        
        if let profileImage = value["profile_image"] as? String{
           // self.userImage = Storage.storage().reference(withPath: "images/\(userId)/\(profileImage)")Ur
            self.userImage = URL(string: profileImage)
        }
    }
}
