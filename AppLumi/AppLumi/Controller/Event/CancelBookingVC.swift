//
//  CancelBookingVC.swift
//  AppLumi
//
//  Created by appinventiv on 25/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class CancelBookingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backBtnWasTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
