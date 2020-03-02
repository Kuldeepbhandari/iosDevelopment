//
//  EmployeeInformation.swift
//  Employee Record System
//
//  Created by appinventiv on 19/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit


class EmployeeInformation {
//    let name:String
//    let department:DepartmentName
//    let dob:String
//    let employeeID:String
//    let gender:Gender
//    let address:String
//    let email:String
//
//    init(dict:[String:Any]) {
//        self.name = dict["name"] as! String
//        self.department = DepartmentName(rawValue: dict["department"] as! DepartmentName.RawValue)!
//        self.dob = dict["dob"] as! String
//        self.employeeID = dict["employeeID"] as! String
//        self.gender = Gender(rawValue: dict["gender"] as! Gender.RawValue)!
//        self.email = dict["email"] as! String
//        self.address = dict["address"] as! String
//    }
    
    let name:String
    let department:DepartmentName
    let dob:String
    let employeeID:String
    let gender:Gender
  //  let address:String
    let email:String
    let phoneNo:Int
    let countryCode:Int
    let aadharNo:Int
    let password:String
    let salary:Int
   // let employeeId:String
    
        init(dict:[String:Any]) {
            self.name = dict["name"] as? String ?? ""
            self.department = DepartmentName(rawValue: dict["department"] as? DepartmentName.RawValue ?? " ")!
            self.gender = Gender(rawValue: dict["gender"] as? Gender.RawValue ?? " ")!
            self.dob = dict["dob"] as? String ?? ""
            self.employeeID = dict["employeeID"] as? String ?? " "
            self.email = dict["email"] as? String ?? " "
            self.phoneNo = dict["phoneNo"] as? Int ?? 0
            self.countryCode = dict["countryCode"] as? Int ?? 0
            self.aadharNo = dict["aadharNo"] as? Int ?? 0
            self.password = dict["password"] as? String ?? ""
            self.salary = dict["salary"] as? Int ?? 0
            
        }
    
}


enum DepartmentName:String,CaseIterable{
    case iOS
    case Node
    case Flutter
    case Blockchain
    case ReactNative
    case Angular
}


enum Gender:String,CaseIterable{
    case Male
    case Female
    case Others
}
