//
//  SelectCountryCodeVC.swift
//  AppLumi
//
//  Created by appinventiv on 21/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

protocol PassCountryCode:class {
    func passCountryCode(code:String,image:UIImage)
}
class SelectCountryCodeVC: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var countryTableView: UITableView!
//   MARK:- Variables
    var countryCodeArr : [CountryData] = []
    var searchedArray: [CountryData] {
        if name.isEmpty{
            return countryCodeArr
        }else{
            return countryCodeArr.filter{($0.countryName.rawValue).contains(name)}
    }
    }
    var name = String()
    weak var delegate : PassCountryCode?
    var filterArr : [CountryData] = []
    var counrtyCode : String?
    var countryImage : String?
    var shouldSearchResult = false
//    MARK:View Lifecycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetup()
        
    }
    
    private func initalSetup(){
        getConutryCodeInformation()
        if let textField = searchBar.value(forKey: "searchField") as? UITextField{
            textField.backgroundColor = UIColor.white
            textField.layer.cornerRadius = 5
            textField.clipsToBounds = true
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1).cgColor
            textField.textColor = UIColor(displayP3Red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        }
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBarButton()
    }
//    MARK:-This function is used to add bar button in navigation bar
    func navigationBarButton(){
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(popViewController))
        let rightButton = UIBarButtonItem(title: "Done", style: .done, target: self, action:#selector(popViewController) )
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func popViewController(){
        self.dismiss(animated: true, completion: nil)
    }
    
//    MARK:This function is used to apeend array
    private func getConutryCodeInformation(){
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
        let cell = tableView.dequeueReusableCell(withIdentifier: countryPickerCell) as! CountryPickerCell
        cell.countryCodeLabel.text = "\(searchedArray[indexPath.row].countryCode.rawValue.localized)"
        cell.countryNameLabel.text = searchedArray[indexPath.row].countryName.rawValue.localized
        cell.countryImg.image = UIImage(named: searchedArray[indexPath.row].flag.rawValue)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        counrtyCode = searchedArray[indexPath.row].countryCode.rawValue
        countryImage = searchedArray[indexPath.row].flag.rawValue
        delegate?.passCountryCode(code: counrtyCode ?? "", image:UIImage(named: countryImage ?? "")!)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
//MARK:This extension is used to search the name 
extension SelectCountryCodeVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        name = searchText
        countryTableView.reloadData()
    }
}
