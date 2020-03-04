//
//  ViewController.swift
//  Employee Record System
//
//  Created by appinventiv on 19/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit


class ListDetailsVC: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    //    MARK:-Outlets
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var employeeListTableView: UITableView!
    
    //    MARK:-Variables
    var departmentArr = [EmployeeInformation]()
    var departmentName = DepartmentName.allCases
    var employeeInfoArr : [EmployeeInformation] = []
    let pickerView = UIPickerView()
    var filterArr = [String]()
    var nameArr = [String]()
    var shouldSearchResult = false
    
    //    MARk:-View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = true
        
    }
}

//MARK:-Table View Delegate methods and datasoucre methods

extension ListDetailsVC:UITableViewDataSource,UITableViewDelegate{
    //    MARK:This function is used to return the number of section is tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldSearchResult{
            return departmentArr.count
        }else{
            switch employeeInfoArr[section].department {
           
            case .iOS:
                let empDept = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.iOS.rawValue})
                return empDept.count
            case .Node:
                let nodeArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.Node.rawValue})
                return nodeArr.count
            case .Flutter:
                let flutterArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.Flutter.rawValue})
                return flutterArr.count
            case .Blockchain:
                let blockchainArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.Blockchain.rawValue})
                return blockchainArr.count
            case .ReactNative:
                let reactNativeArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.ReactNative.rawValue})
                return reactNativeArr.count
            case .Angular:
                let angularArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.Angular.rawValue})
                return angularArr.count
            }
        }
    }
    //MARK:-This function is used to return the cell in tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
       if shouldSearchResult{
        cell.departmentlabel.text = employeeInfoArr[indexPath.row].department.rawValue
        cell.nameLbl.text = employeeInfoArr[indexPath.row].name
            cell.getInfo.isHidden = true
        }
            cell.departmentlabel.text = employeeInfoArr[indexPath.row].department.rawValue
            cell.nameLbl.text = employeeInfoArr[indexPath.row].name
        
        return cell
    }
    
    //MARK:-Table View  Section
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return employeeInfoArr.count
    }
    
    //MARK:_This function is used to return the title for header in section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if shouldSearchResult{
            return ""
        }else{
        return employeeInfoArr[section].department.rawValue
        }
    }
    //MARK:_this function is used to return the no of employee in footer secction
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if shouldSearchResult{
            return ""
        }else{
        switch employeeInfoArr[section].department{
            case .iOS:
                let iOSArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.iOS.rawValue})
                return "The no of employee in = \(iOSArr.count)"
            case .Node:
                let nodeArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.Node.rawValue})
                return "The no of employee in = \(nodeArr.count)"
            case .Flutter:
                let flutterArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.Flutter.rawValue})
                return "The no of employee in = \(flutterArr.count)"
            case .Blockchain:
                let blockChainArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.Blockchain.rawValue})
                return "The no of employee in = \(blockChainArr.count)"
            case .ReactNative:
                let reactArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.ReactNative.rawValue})
                return "The no of employee in = \(reactArr.count)"
            case .Angular:
                let angualrArr = employeeInfoArr.filter({$0.department.rawValue == DepartmentName.Angular.rawValue})
                return "The no of employee in = \(angualrArr.count)"
        }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    //    MARK:-This function is used to deletet the row in cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && shouldSearchResult{
            self.departmentArr.remove(at: indexPath.row)
            self.employeeListTableView.reloadData()
        }else{
            self.employeeInfoArr.remove(at: indexPath.row)
            self.employeeListTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
    }
    
}


//MARK:Confirm Protocol extension
//}

extension ListDetailsVC:SaveDataOnTappedRegisterProtocol{
    func sendDetails(dict: [String : Any]) {
       let employeeInfo = EmployeeInformation(dict: dict)
        employeeInfoArr.append(employeeInfo)
        tableView.reloadData()

    }
}

//MARK:This Extension is used to search the employee

extension ListDetailsVC:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        departmentArr = employeeInfoArr.filter({$0.name.contains(searchText)})
        shouldSearchResult = true
        employeeListTableView.reloadData()
    }
    
   
}
