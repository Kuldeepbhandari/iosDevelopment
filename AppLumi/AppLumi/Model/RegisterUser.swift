//
//  RegisterUser.swift
//  AppLumi
//
//  Created by appinventiv on 06/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation

struct RegisterUser{
    var userName:String?
    var dob:String?
    var gender:Gender?
}


enum Gender:String{
    case Male = "Male"
    case Female = "Female"
    case Others = "Non-Binary"
}

