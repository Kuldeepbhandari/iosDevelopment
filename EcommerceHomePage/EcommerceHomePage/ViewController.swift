//
//  ViewController.swift
//  EcommerceHomePage
//
//  Created by mac on 02/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell") as! FeatureCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
                       return cell
        }


}
}
