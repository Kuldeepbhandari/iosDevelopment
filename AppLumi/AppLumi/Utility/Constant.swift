//
//  Constant.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 27/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation
import Alamofire


typealias CompletionHandler = (_ Sucess:Bool) -> ()

//API Keys

let BASE_URL = "http://3.92.170.227:7008/"
let GET_OTP = "\(BASE_URL)lumi-app/loginWithOTP"
let VERIFY_OTP_URL = "\(BASE_URL)lumi-app/verifyOTP"
let COMPLETE_PROFILE_URL = "\(BASE_URL)lumi-app/completeProfile/step1"
let GET_QUESTIONS_URL = "\(BASE_URL)lumi-app/updateProfile/Bio/getQuestions"
let ANSWER_BIO_QUESTIONS = "\(BASE_URL)lumi-app/updateProfile/bio/answer"
let UPADTE_EDUCTAION_DETAIL_URL = "\(BASE_URL)lumi-app/updateProfile/education"
let UPDATE_DRUGS_URL = "\(BASE_URL)lumi-app/updateProfile/Marijuana"
let UPDATE_GENDER_URL = "\(BASE_URL)lumi-app/updateProfile/interestedIn"
let UPDATE_AGE_URL = "\(BASE_URL)lumi-app/updateProfile/interestedAge"
let UPDATE_SMOKING_URL = "\(BASE_URL)lumi-app/updateProfile/Smoking"
let UPDATE_RELIGION_URL = "\(BASE_URL)lumi-app/updateProfile/Religion"
let UPDATE_POLITICAL_URL = "\(BASE_URL)lumi-app/updateProfile/political"
let UPDATE_ALCOHOL_URL = "\(BASE_URL)lumi-app/updateProfile/alcohol"
let UPDATE_PROFILE_DRUGS_URL = "\(BASE_URL)lumi-app/updateProfile/drugs"
let UPDATE_HEIGHT_URL = "\(BASE_URL)lumi-app/updateHeight"
let GET_JOB_TITLE_URL = "\(BASE_URL)lumi-app/jobTitle/list"
let PUT_JOB_TITLE_URL = "\(BASE_URL)lumi-app/updateJobTitle"
let UPDATE_LOCATION_URL = "\(BASE_URL)lumi-app/completeProfile/location"
let GET_PROFILE_USER_URL = "\(BASE_URL)lumi-app/user/profile"
let SAVE_IMAGE_ON_SERVER_URL = "\(BASE_URL)lumi-app/upload/avatar"
let GET_IMAGE_FROM_SERVER_URL = "\(BASE_URL)lumi-app/profile/getProfilePicture"
let GET_EVENT_DETAILS_URL = "\(BASE_URL)lumi-app/events"
let CHECK_EXISTING_ACCOUNT = "\(BASE_URL)lumi-app/linkExistingProfile/"
let SAVED_CARD_DETAILS_URL = "\(BASE_URL)lumi-app/saveCardDetails"
let GET_SAVED_CARD_DETAILS_URL = "\(BASE_URL)lumi-app/getSavedCards"
let LOGOUT_USER_URL = "\(BASE_URL)lumi-app/settings/logOut"
let BOOKING_PAYMENT_URL = "\(BASE_URL)lumi-app/payment/savedCard"
let GENRAL_PAYMENT_URL = "\(BASE_URL)lumi-app/payment/general"
let BOOKING_EVENT_URL = "\(BASE_URL)lumi-app/settings/myBookings"
let SAVE_USER_DETAILS_URL = "\(BASE_URL)lumi-app/submitDetais"
//MARK:Header

var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZWRlMjY1YjJmYjA1MjE4YjE5MjgyZmUiLCJpYXQiOjE1OTE3MDMxMDJ9.2OrgCXVuumFetVqVD2DW6Jiof-tzVaDbvWlWy7bYUfw"



let HEADER  : HTTPHeaders = [
    "Content-Type" : "application/json; charset=utf-8",
    "Authorization" : "Bearer \(AuthServices.instance.authToken)"
//    "Authorization" : "Bearer \(token)"

]

//TextFiledColor

 
//UserDeafult

let USER_ID = "userId"
let AUTH_TOKEN = "authToken"
let _Event = "event"
let defaults = UserDefaults.standard


//Button Color

enum AppColors {
   static var selectBtn  : UIColor{
        return #colorLiteral(red: 0.3773238659, green: 0.6838361621, blue: 0.9854741693, alpha: 1)
    }
   static var selectTitleColor : UIColor{
        return #colorLiteral(red: 0.9656763673, green: 0.965699017, blue: 0.9656868577, alpha: 1)
    }
   static var defaultColor : UIColor{
        return #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
    }
  static  var defaultTitleColor : UIColor{
        return #colorLiteral(red: 0.3621281683, green: 0.3621373773, blue: 0.3621324301, alpha: 1)
    }
}
