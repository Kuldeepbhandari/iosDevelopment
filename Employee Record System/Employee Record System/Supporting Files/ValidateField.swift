//
//  ValidateField.swift
//  Employee Record System
//
//  Created by appinventiv on 21/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation


class Validatoin{
    
enum Alert{
    case sucees
    case failure
    case error
}

enum Valid{
    case sucees
    case failure(Alert,AlertMessage)
}

enum ValidationType{
    case Email
    case PhoneNo
    case password
}

enum AlertMessage:String{
    case inValidEmail = "Invalid Email"
    case inValidFirstLetterCaps = "inValidFirstLetterCaps"
    case inValidPhone = "inValidPhone"
    case invalidAlphabeticString = "invalidAlphabeticString"
    case inValidPassWord = "inValidPassWord"
    case emptyPhone = "emptyPhone"
    case emptyEmail = "emptyEmail"
    case emptyFirstLetterCaps = "emptyFirstLetterCaps"
    case emptyAlphabeticString = "emptyAlphabeticString"
    case emptyPSW = "emptyPassword"
}


enum Regex:String{
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    case password = "^.{6,15}$"
    case alphabeticStringWithSpace = "^[a-zA-Z ]*$"
    case alphabeticStringFirstLetterCaps = "^[A-Z]+[a-zA-Z]*$"
    case phoneNo = "[0-9]{10,14}"
    
}
}

