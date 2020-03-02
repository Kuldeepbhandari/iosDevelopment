//
//  EmployeeData.swift
//  Employee Record System
//
//  Created by appinventiv on 28/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation


class EmployeeData {
    
    let name:String
    let department:DepartmentName
    let dob:String
    let employeeID:String
    let gender:Gender
    let address:String
    let email:String
    let phoneNo:Int
    let countryCode:Int
    let aadharNo:Int
    let password:String
    let salary:Int
    let employeeId:String
    
        init(dict:[String:Any]) {
            self.name = dict["name"] as! String
            self.department = DepartmentName(rawValue: dict["gender"] as! DepartmentName.RawValue)!
            self.dob = dict["dob"] as! String
            self.employeeID = dict["employeeID"] as! String
            self.gender = Gender(rawValue: dict["gender"] as! Gender.RawValue)!
            self.email = dict["email"] as! String
            self.address = dict["address"] as! String
            self.phoneNo = dict["phoneNo"] as! Int
            self.countryCode = dict["countryCode"] as! Int
            self.aadharNo = dict["aadharNo"] as! Int
            self.password = dict["password"] as! String
            self.salary = dict["salary"] as! Int
            self.employeeId = dict["employeeId"] as! String
            
        }
}
