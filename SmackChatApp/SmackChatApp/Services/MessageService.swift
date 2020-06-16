//
//  MessageService.swift
//  SmackChatApp
//
//  Created by mac on 30/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class MessageService {
    
    static let instance = MessageService()
    var channels = [Channel]()
    var messages = [Message]()
    //For select channel
    var selectedChannel:Channel?
    var unreadChannel = [String]()
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        let header : HTTPHeaders = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
            "Content-Type" : "application/json ; charset = utf-8"
        ]
        AF.request(URL_GET_CHANNEL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseData { (response) in
            if response.error == nil {
                guard let data = response.data else { return }
                do{
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            AuthService.instance.userId = item["_id"].stringValue
                            let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: AuthService.instance.userId)
                            self.channels.append(channel)
                        }
                        //   print(self.channels[0].channelTitle ?? "")
                        //                        to post the request new channel is loaded
                        NotificationCenter.default.post(name: NOTIF_CHANNEL_LOADED, object: nil)
                        completion(true)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            else {
                completion(false)
                debugPrint(response.error as Any)
            }
        }
    }
    //    TO remove all the chaanel if we logged out
    //    and we have to call this fuction to somewhere
    
    func clearChannel(){
        channels.removeAll()
        
    }
    
    //    MARK:this function is used to get all the mesaage
    
    func findAllMessage(channelId:String,completion:@escaping CompletionHandler){
        let header : HTTPHeaders = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
            "Content-Type" : "application/json ; charset = utf-8"
        ]
        
        AF.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.error == nil{
                self.clearMessage()
                guard let data = response.data else {return}
                do{
                    if let json = try JSON(data: data).array {
                        for item in json{
                            let messageBody = item["messageBody"].stringValue
                            let channelId = item["channelId"].stringValue
                            AuthService.instance.userId = item["_id"].stringValue
                            let userName = item["userName"].stringValue
                            let userAvatar = item["userAvatar"].stringValue
                            let userAvatarColor = item["userAvatarColor"].stringValue
                            let timeStamp = item["timeStamp"].stringValue
                            let message = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: AuthService.instance.userId, timeStamp: timeStamp)
                            self.messages.append(message)
                        }
                        completion(true)
                        print(self.messages)
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }else{
                debugPrint(response.error as Any)
                completion(false)
            }
        }
    }
    
    
    
    //    MARK:to clear the message for different user
    func clearMessage(){
        messages.removeAll()
    }
}

