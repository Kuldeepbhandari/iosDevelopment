//
//  AuthServices.swift
//  AppLumi
//
//  Created by appinventiv on 28/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthServices{
    
    static let instance = AuthServices()
    let defaults = UserDefaults.standard
    var getQuetionsArr = [GetQuestions]()
    var eventDetails =  [Event]()

    var verifyCodeID : String{
        get{
            return defaults.value(forKey: USER_ID) as? String ?? ""
        }
        set{
            return defaults.set(newValue, forKey: USER_ID)
        }
    }
    
    var authToken: String{
        get{
            return defaults.value(forKey: AUTH_TOKEN) as? String ?? ""
        }
        set{
            return defaults.set(newValue, forKey: AUTH_TOKEN)
        }
    }
    //    MARK:This function is used to send otp in any device
    
    func sendOtpToPhone(countryCode:String,mobileNo:String,completion:@escaping CompletionHandler){
        let hedaer : HTTPHeaders = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
        let body : [String:Any] = [
            "phonenumber":mobileNo,
            "channel":"sms",
            "countrycode":countryCode
        ]
        AF.request(GET_OTP, method: .get, parameters: body, encoding: URLEncoding.default, headers: hedaer).responseJSON { [weak self] (response)  in
            if response.error == nil{
                guard let data = response.data else {return}
                print(data)
                completion(true)
            }else{
                let httpStatusCode = response.response?.statusCode
                print(httpStatusCode as Any)
                debugPrint(response.error as Any)
                completion(false)
            }
        }
    }
    //    MARK:This function is used to verify otp
    func veirfyOtp(countryCode:String,mobileNo:String,Otp:String,completion:@escaping CompletionHandler){
        let hedaer : HTTPHeaders = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        let body : [String:Any] = [
            "countryCode":countryCode,
            "mobileNo":mobileNo,
            "code":Otp
        ]
        
        //        MARK:Alamofire Request for Veify Otp
        AF.request(VERIFY_OTP_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: hedaer).responseData { [weak self] (response) in
            guard let strongSelf = self else {return}

            if response.error == nil{
                guard let data = response.data else {return}
                do{
                    if let json = try JSON(data: data).dictionaryObject {
                        for (key,_) in json{
                            var dataDict : NSDictionary?
                            strongSelf.authToken = json["authToken"] as? String ?? ""
                            print("token:\(AuthServices.instance.authToken)")
                            dataDict = json["data"] as? NSDictionary
                            strongSelf.verifyCodeID = dataDict?["_id"] as? String ?? ""
                            print(key)
                        }
                        print(strongSelf.verifyCodeID)
                        completion(true)
                    }
                }   catch{
                    print(error.localizedDescription)
                }
            }else{
                completion(false)
                print(response.error as Any)
            }
        }
    }
        
        //        MARK:This functin is used to register the user
        
        func registerUser(userName:String,gender:String,dob:String,completion:@escaping CompletionHandler){
            let body : [String:Any] = [ "userName":userName,
                                        "dob":dob,
                                        "gender":gender
            ]
            AF.request(COMPLETE_PROFILE_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).response { (response) in
                if response.error == nil{
                print(response)
                completion(true)
                }else{
                    print(response.error as Any)
                    completion(false)
                }
            }
    }
    
    //    MARK:This function is used to get questions from API
         func getQuestionsList(completion:@escaping CompletionHandler){
            AF.request(GET_QUESTIONS_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON{ [weak self](response) in
                guard let strongSelf = self else {return}
                if response.error == nil{
                    guard let json = response.value as? Dictionary<String,Any> else {return}
                    guard let question = json["data"] as? [Dictionary<String,Any>] else {return}
                    for key in question{
                        let questions = key["question"] as? String ?? ""
                        let id = key["Q_id"] as? Int ?? 0
                        let answer = key["answer"] as? String ?? ""
                        let getQuestion = GetQuestions(question:questions, answer: answer, Q_id: id)
                        strongSelf.getQuetionsArr.append(getQuestion)
                }
                    print(strongSelf.getQuetionsArr)
                    completion(true)
                    
                }else{
                    debugPrint(response.error as Any)
                    completion(false)
                }
            }
    }

    func updateDataOnServer(dict:[String:Any] , url:URLConvertible, completion:@escaping CompletionHandler){
        AF.request(url, method: .put, parameters: dict, encoding: JSONEncoding.default, headers: HEADER).response { (response) in
            if response.error == nil{
                print("Data is send")
                completion(true)
            }else{
                debugPrint(response.error as Any)
                completion(false)
            }
        }
    }
    
    func getEventDetails(completion : CompletionHandler){
        
        let param : [String:Any] = ["address": "sector 18 Noida",
                                    "date" : "04-26-2020"
        ]
        
        AF.request(GET_EVENT_DETAILS_URL, method: .get, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON {  (response) in
             print(response)
              guard let data = response.data else {return}
                        DispatchQueue.main.async {
                            self.parseDataUsingCodable(data: data)
                        }
        }
    }
    
    
    func parseDataUsingCodable(data:Data){
        print(data)
       
        
        do{
             //let json = try JSON(data: data)
            
            let eventDetail = try JSONDecoder().decode(EventDetail.self, from: data)
            print(eventDetail)
            for event in eventDetail.events{
                eventDetails.append(event)
            }
            print(eventDetails)
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
}

