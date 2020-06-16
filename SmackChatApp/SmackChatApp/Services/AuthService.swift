//
//  AuthService.swift
//  SmackChatApp
//
//  Created by mac on 27/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService{
    
    static let instance = AuthService()
    let defaults = UserDefaults.standard
    var isLoggedIn:Bool{
        get{
            return defaults.bool(forKey: USER_LOGGED_IN)
        }
        set{
            return defaults.set(newValue, forKey: USER_LOGGED_IN)
        }
    }
    
    var authToken : String{
        get{
            return defaults.value(forKey: AUTH_TOKEN) as! String
        }
        set{
            return defaults.set(newValue, forKey: AUTH_TOKEN)
        }
    }
    
    var userEmail:String{
            get{
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            return defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    var userId: String{
        get{
            return defaults.value(forKey: USER_ID) as! String
        }set{
            return defaults.set(newValue, forKey: USER_ID)
        }
    }
    
    
    //    MARK:This function is used to register a user
    func registerUser(email:String,password:String,completion: @escaping CompletionHandler){
        let lowerEmail = email.lowercased()
        let header  : HTTPHeaders = [
            "Content-Type" : "application/json ; charset = utf-8"
        ]
        let body : [String:Any] = [
            "email":lowerEmail,
            "password":password
        ]
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString {(response) in
            if response.error == nil{
                completion(true)
            }else{
                completion(false)
            }
        }
    }
    
    
    func loginUser(email:String,password:String,completion:@escaping CompletionHandler){
        let lowerEmail = email.lowercased()
        let header  : HTTPHeaders = [
            "Content-Type" : "application/json ; charset = utf-8"
        ]
        let body : [String:Any] = [
            "email":lowerEmail,
            "password":password
        ]
        AF.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.error == nil{
                 guard let data = response.data else {return}
                                do{
                                    let json = try JSON(data: data)
                                    self.userEmail = json["user"].stringValue
                                    self.authToken = json["token"].stringValue
                                    self.isLoggedIn = true
                                    completion(true)
                                } catch let error{
                                    print(error.localizedDescription)
                                }
            }else{
                completion(false)
                debugPrint(response.error as Any)
            }
        }
    }
    
    func createUser(name:String,email:String,avatarName:String,avatarColor:String,completion:@escaping CompletionHandler){
        let lowerEmail = email.lowercased()
        let body = [
            "name":name,
            "email":lowerEmail,
            "avatarName":avatarName,
            "avatarColor":avatarColor
        ]
        
        let header : HTTPHeaders = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
            "Content-Type" : "application/json ; charset = utf-8"
        ]
        
        AF.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.error == nil{
                guard let data = response.data else {return}
                self.setUserInfoData(data: data)
                completion(true)
            }else{
                completion(false)
                debugPrint(response.error as Any)
            }
            
        }
    }
    
    
    func findUserByEmail( comepltion:@escaping CompletionHandler){
        
        let header : HTTPHeaders = [
                   "Authorization": "Bearer \(AuthService.instance.authToken)",
                   "Content-Type" : "application/json ; charset = utf-8"
               ]
        AF.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.error == nil{
                guard let data = response.data else {return}
                self.setUserInfoData(data: data)
                comepltion(true)
            }else{
                comepltion(false)
                debugPrint(response.error as Any)
            }
        }
    }
    
    func setUserInfoData(data:Data){
        do{
        let json = try JSON(data: data)
            self.userId = json["_id"].stringValue
            let color = json["avatarColor"].stringValue
            let avatarName = json["avatarName"].stringValue
            let email = json["email"].stringValue
            let name = json["name"].stringValue
            UserDataServices.instance.setUserData(id: self.userId, color: color, avatarName: avatarName, email: email, name: name)
            
        }catch let eror{
            print(eror.localizedDescription)
        }
    }
}
