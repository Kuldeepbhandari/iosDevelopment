//
//  SocketServices.swift
//  SmackChatApp
//
//  Created by mac on 01/04/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit
import SocketIO

class SocketServices: NSObject {

    static let instance = SocketServices()
    let manager : SocketManager
    let socket : SocketIOClient
    
    override init() {
        self.manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        self.socket = manager.defaultSocket
        super.init()
    }
    
    func establishConnection(){
        socket.connect()
    }
    
    func closeConnection(){
        socket.disconnect()
    }
    
//    when we send request to server basically we request for a emit
//    MARK:This functoin is used to send some informtion to the api
    
    func addChannel(channelName:String,channelDescription:String,completion:@escaping CompletionHandler){
//        emit is used to send information to the server and the newChannel is the key and channelName and channelDescription is the value
        socket.emit("newChannel", channelName,channelDescription)
        completion(true)
    }
//    this is the dataArray what we get from the server and we have to save it into an array
    
//    channel.name channel.description channel.id
    
//    MARK:This function is used to get chaanel from api the socket.on is work as listner
//    The callback that will execute when this event is received.

    func getChannel(completion:@escaping CompletionHandler){
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDesc = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
            
//            so if we waana update the list of chaanel we have to do some other stuff in channelVC
        }
    }
    
//    MARK:this function is used to add  message in our api
    
    func addMessage(messageBody:String,userId:String,channelId:String,completion:@escaping CompletionHandler){
        let user = UserDataServices.instance
        //this lines help we send send the data to the api bascially emit is used to send the data on the server
        socket.emit("newMessage", messageBody,userId,channelId,user.name,user.avatarName,user.avatarColor)
        completion(true)
    }
    
//    MARK:This function is used to message from server
    
    func getChatMessage(completion:@escaping (_ newMesaage:Message) -> Void){
        socket.on("messageCreated") { (dataArr, ack) in
            guard let msgBody = dataArr[0] as? String else {return}
            guard let channelId = dataArr[2] as? String else {return}
            guard let userName = dataArr[3] as? String else {return}
            guard let userAvatar = dataArr[4] as? String else {return}
            guard let userAvatarColor = dataArr[5] as? String else {return}
            guard let id = dataArr[6] as? String else {return}
            guard let timeStamp = dataArr[7] as? String else {return}
            let message = Message(message: msgBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
//            
            completion(message)
    }
    }
    
    
//    MARK:this funtion is used to get all the users name while they are typing
    
    func getTypingUsers(_ completionHandler : @escaping (_ typingUsers:[String:String]) -> Void){
        socket.on("usersTypingUpdate") { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String:String] else{return}
            completionHandler(typingUsers)
        }
    }
    
}
