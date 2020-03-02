//
//  SignUpVC.swift
//  TravelApp
//
//  Created by mac on 27/02/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var btnFacebook: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       // btnFacebook.designButton( borderWidth:CGFloat = 1, borderColor:UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        // Do any additional setup after loading the view.
        btnFacebook.designButton(borderWidth: 1, borderColor: UIColor.clear)
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
