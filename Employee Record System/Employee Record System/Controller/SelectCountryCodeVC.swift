//
//  CountryPickerVC.swift
//  Employee Record System
//
//  Created by appinventiv on 24/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit


protocol PassCountryCode:class {
    func selectCountryCode(code:String)
}
class SelectCountryCodeVC: UIViewController {
    
    var name = String()
    @IBOutlet var countryTableView: UITableView!
    var countryCodeArr : [CountryData] = []
    var searchedArray: [CountryData] {
        if name.isEmpty{
            return countryCodeArr
        }else{
            return countryCodeArr.filter{($0.countryName.rawValue).contains(name)}
        
    }
    }
    weak var delegate : PassCountryCode?
    var filterArr : [CountryData] = []
    var counrtyCode : String?
    var selectCell = false
    var shouldSearchResult = false
    override func viewDidLoad() {
        super.viewDidLoad()
        countryCode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBarButton()
    }
    
    func navigationBarButton(){
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(popViewController))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func popViewController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    private func countryCode(){
        let afghanistan = CountryData(countryName: CountryName(rawValue: CountryName.Afghanistan.rawValue)!, countryCode: CountryCode(rawValue: CountryCode.Afghanistan.rawValue)!, flag: Flag(rawValue: Flag.Afghanistan.rawValue)!)
        let india = CountryData(countryName: CountryName(rawValue: CountryName.India.rawValue)!, countryCode: CountryCode(rawValue: CountryCode.India.rawValue)!, flag: Flag(rawValue: Flag.India.rawValue)!)
        let australia = CountryData(countryName: CountryName(rawValue: CountryName.Afghanistan.rawValue)!, countryCode: CountryCode(rawValue: CountryCode.Afghanistan.rawValue)!, flag: Flag(rawValue: Flag.Afghanistan.rawValue)!)
        let bhutan = CountryData(countryName: CountryName(rawValue: CountryName.Bhutan.rawValue)!, countryCode: CountryCode(rawValue: CountryCode.Bhutan.rawValue)!, flag: Flag(rawValue: Flag.Bhutan.rawValue)!)
        let brazil = CountryData(countryName: CountryName(rawValue: CountryName.Brazil.rawValue)!, countryCode: CountryCode(rawValue: CountryCode.Brazil.rawValue)!, flag: Flag(rawValue: Flag.Brazil.rawValue)!)
        let canada = CountryData(countryName: CountryName(rawValue: CountryName.Canada.rawValue)!, countryCode: CountryCode(rawValue: CountryCode.Canada.rawValue)!, flag: Flag(rawValue: Flag.Canada.rawValue)!)
        let china = CountryData(countryName: CountryName(rawValue: CountryName.China.rawValue)!, countryCode: CountryCode(rawValue: CountryCode.China.rawValue)!, flag: Flag(rawValue: Flag.China.rawValue)!)
        let france = CountryData(countryName: CountryName(rawValue: CountryName.France.rawValue)!, countryCode: CountryCode(rawValue: CountryCode.France.rawValue)!, flag: Flag(rawValue: Flag.France.rawValue)!)
        let japan = CountryData(countryName: CountryName(rawValue: CountryName.Japan.rawValue)!, countryCode: CountryCode(rawValue: CountryCode.Japan.rawValue)!, flag: Flag(rawValue: Flag.Japan.rawValue)!)
        let pakistan = CountryData(countryName: CountryName(rawValue: CountryName.Pakistan.rawValue)!, countryCode: CountryCode(rawValue: CountryCode.Pakistan.rawValue)!, flag: Flag(rawValue: Flag.Pakistan.rawValue)!)
        countryCodeArr = [afghanistan,india,australia,bhutan,brazil,canada,china,france,japan,pakistan]
    }
}
//MARK:-UitableView Delegate and datasource methods
extension SelectCountryCodeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryPickerCell") as! CountryPickerCell
        cell.countryCodeLabel.text = "\(searchedArray[indexPath.row].countryCode.rawValue)"
        cell.countryNameLabel.text = searchedArray[indexPath.row].countryName.rawValue
        cell.countryImg.image = UIImage(named: searchedArray[indexPath.row].flag.rawValue)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if selectCell{
         cell?.accessoryType = .none
            selectCell = false
        }else{
            cell?.accessoryType = .checkmark
            counrtyCode = searchedArray[indexPath.row].countryCode.rawValue
            selectCell = true
        }
        tableView.reloadData()
        delegate?.selectCountryCode(code: counrtyCode ?? "")
  }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
extension SelectCountryCodeVC:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        name = searchText
        countryTableView.reloadData()
    }
}
