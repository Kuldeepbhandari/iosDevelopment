//
//  ChangeHeightVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 01/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class ChangeHeightVC: UIViewController {

    @IBOutlet weak var inchTableView: UITableView!
    @IBOutlet weak var feetTableView: UITableView!
    
    var feetArr = [1,2,3,4,5,6,7,8]
    var inchArr = [0,1,2,3,4,5,6,7,8,9,10,11,12]
    var selectFeet = Int()
    var selectInch = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetupView()
    }
    
    func initalSetupView(){
        inchTableView.delegate = self
        feetTableView.delegate = self
        inchTableView.dataSource = self
        feetTableView.dataSource = self
    }

    @IBAction func dismissViewBtnWasPressed(_ sender: UIButton) {
    }
    
    @IBAction func saveBtnWasPressed(_ sender: UIButton) {
    }
    
}


extension ChangeHeightVC:UITableViewDataSource,UITableViewDelegate{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          var count : Int?
          if tableView == self.feetTableView{
              count = feetArr.count
          }
          if tableView == self.inchTableView{
              count = inchArr.count
          }
          return count!
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          if tableView == self.feetTableView{
              if let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeFeetCell", for: indexPath) as? ChangeFeetCell{
                cell.feetLabel.text = "\(feetArr[indexPath.row])"
                  return cell
              }
          }
          if tableView == self.inchTableView{
              if let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeInchCell", for: indexPath) as? ChangeInchCell{
                cell.inchLabel.text = "\(inchArr[indexPath.row])"
                  return cell
              }
          }else{
              return UITableViewCell()
          }
          return UITableViewCell()
      }
      
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          if tableView == self.feetTableView{
               selectFeet = feetArr[indexPath.row]
              print(selectFeet)
          }
          if tableView == self.inchTableView{
              selectInch = inchArr[indexPath.row]
              print(selectInch)
          }
      }
    
}
