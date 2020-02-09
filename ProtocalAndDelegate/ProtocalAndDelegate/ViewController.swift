//
//  ViewController.swift
//  ProtocalAndDelegate
//
//  Created by mac on 09/02/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        lblCity.text = ""
//        lblAddress.text = ""
//        lblName.text = ""
    }

    @IBAction func goToformTapped(_ sender: UIButton) {
        let stroyboard  = self.storyboard?.instantiateViewController(identifier: "SecondVC") as! SecondVC
        stroyboard.delegate = self
        stroyboard.address = lblAddress.text
        stroyboard.city = lblCity.text
        stroyboard.name = lblName.text
        self.navigationController?.pushViewController(stroyboard, animated: true)
        
    }
}

//Conform Protocol Extension
extension ViewController: DataPassProtocol{
    func dataPassUsingDict(object: [String : String]) {
        lblName.text = object["name"]
        lblAddress.text = object["address"]
        lblCity.text = object["city"]
    }
    
    //    func dataPass(name: String, address: String, city: String) {
    //        lblName.text = name
    //        lblAddress.text = address
    //        lblCity.text = city
    //    }
    
}
