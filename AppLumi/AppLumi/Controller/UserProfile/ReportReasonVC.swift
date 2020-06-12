//
//  ReportReasonVC.swift
//  AppLumi
//
//  Created by mac on 10/06/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class ReportReasonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelBtnWasTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
