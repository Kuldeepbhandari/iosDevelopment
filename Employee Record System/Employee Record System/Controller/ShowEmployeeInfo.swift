//
//  ShowEmployeeInfo.swift
//  Employee Record System
//
//  Created by appinventiv on 19/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class ShowEmployeeInfo: UIViewController {

    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var employeeId: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    

    var address:String?
    var gender:String?
    var email:String?
    var empId:String?
    var dob:String?
    var department:String?
    var name:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressLabel.text = address
        genderLabel.text = gender
        dobLabel.text = dob
        emailLabel.text = email
        employeeId.text = empId
        departmentLabel.text = department
        nameLbl.text = name
    }
    
}
