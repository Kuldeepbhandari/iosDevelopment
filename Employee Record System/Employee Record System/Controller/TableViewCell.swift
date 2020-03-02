//
//  TableViewCell.swift
//  Employee Record System
//
//  Created by appinventiv on 19/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

//protocol SendDetail : class {
//    func dataBack(str: String)
//}

class TableViewCell: UITableViewCell {

//    weak var delegate: SendDetail?
    
    @IBOutlet weak var departmentlabel: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var getInfo: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    
    @IBAction func getInfoAction(_ sender: UIButton) {
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension TableViewCell{
    
    func showEmployeeInfo(employeeInfo: EmployeeInformation) {
        nameLbl.text = employeeInfo.name
        departmentlabel.text = employeeInfo.department.rawValue
    }
}

extension TableViewCell:passDataProtocol{
    func dataPass(dict: [String : Any]) {
        
    }
}
