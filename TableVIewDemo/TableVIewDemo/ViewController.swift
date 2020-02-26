//
//  ViewController.swift
//  TableVIewDemo
//
//  Created by mac on 26/02/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class PhoneCategory{
    var phoneCategory:String?
    var phoneName:[String]?
    
    init(phoneCategory:String,phoneName:[String]) {
        self.phoneCategory = phoneCategory
        self.phoneName = phoneName
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var phoneCategoryArr = [PhoneCategory]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        phoneCategoryArr.append(PhoneCategory(phoneCategory: "Iphone", phoneName: ["IPhoneXR","IPhone8","IPhone6S","IPhone8","IPhone11"]))
                                phoneCategoryArr.append(PhoneCategory(phoneCategory: "ASUS", phoneName: ["AsusZenphone","AsusZenphone3","AsusRogue","AsusZenphone5"]))
                                phoneCategoryArr.append(PhoneCategory(phoneCategory: "MI", phoneName: ["Redmi7","Redmi Note 7","Redmi Note 8","Redmi Note Pro"]))
        
                                phoneCategoryArr.append(PhoneCategory(phoneCategory: "Samsung", phoneName: ["Samsung Guru","Samsung note7","Samsung note8","Samsung note9"]))
    }


}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        phoneCategoryArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        phoneCategoryArr[section].phoneName!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = phoneCategoryArr[indexPath.section].phoneName![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return phoneCategoryArr[section].phoneCategory
    }
    
    
}
